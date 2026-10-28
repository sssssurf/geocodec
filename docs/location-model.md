# 地点统一模型与不确定度契约（0.5.0）

Geohash、Plus Code、Maidenhead 原生表示区域；十进制、DMS、geo URI 原生表示点。
共享 Location 接口不等于把这些记法压成相同的裸坐标。

| 字段/方法 | 契约 |
| --- | --- |
| kind / format | 原记法是 Cell 还是 Point，以及具体格式 |
| point | 原坐标或代表中心；不独立证明物理对象就在此处 |
| region / bounds() | 记法几何：精确网格、点的 u 保守包络或退化坐标；不是统一的测量准确度证明 |
| uncertainty_m: Double? | None 是未知；Some(0) 是原文显式零；Some(u) 是声明/传播的覆盖界 |
| cell_radius_m: Double? | 单元自身的几何覆盖半径；点为 None；与源准确度独立 |
| uncertainty_known() | 从 uncertainty_m 是否为 Some 推导，没有可矛盾的布尔存储 |
| uncertainty_bounds() | 围绕代表点的水平不确定度包络；未知时为 None |
| resolution_m / area_m2 | 网格近似长边/面积，或点的 u 名义直径/面积；退化几何为 0，不是零误差声明 |
| altitude_m / crs / raw | 原高程、显式 WGS84 标签、去外部空白的原文；未指定 CRS 按规范默认 WGS84 |

Location、GeoUri、LocationConversion 在包外只读，调用方不能用结构体字面量或
更新语法把未知改成零、把 CRS 改成未知标签，绕过校验。

## 未知不会归零

`parse_location("geo:1,2")`、十进制和 DMS 返回 `uncertainty_m = None`，
CLI JSON 输出 `"uncertainty_m":null`，URI 不添加 u。
`parse_location("geo:1,2;u=0")` 返回 Some(0)，JSON 为 0，并保留 `;u=0`。
不根据坐标小数位数猜测准确度。`region` 中的退化点仅表示输入坐标，不证明
物理位置误差为零；需要判断实际位置包络的消费者应使用 uncertainty_bounds()。

## 转换传播规则

`to_cell` 和 `convert_to_cell` 采用同一安全规则，不能通过低层函数绕开：

1. 网格包含源代表点；目标 region 是该网格几何。
2. 源 uncertainty_m 为 None，目标也为 None；即使 cell_radius_m 已知，也不填入源准确度。
3. 源界 u 已知，围绕目标中心的界至少为 `max(u + 中心位移上界, 目标几何半径)`，
   加数值余量向外保守。目标的 uncertainty_m 本身携带此传播结果。
4. 再转换时继续传播目标中保留的界或未知状态，不会重置为新网格半径。
5. convert_to_cell 额外保留 source、target、center_shift_bound_m，
   uncertainty_bound_m 与 target.uncertainty_m 一致。无法表示有限界时返回 None。

40 m 不确定度点转为 15 位 Plus Code，目标网格几何半径低于 1 cm，但其
uncertainty_m 仍至少为 40 m；to_geouri 输出的 u 使用传播界。
未知准确度点无论转几次，to_geouri 都省略 u。

独立解析一个网格码时，该码本身定义一个区域，uncertainty_m 因而可取几何覆盖界。
这与“把测量点量化成码”的源准确度不是一回事。单独导出 target.raw 再解析会丢掉
转换来源，因此要传递完整转换记录或 to_geouri，不能只传目标码来声称保留源准确度。

转换还会丢失形状：网格转 geo URI 用圆覆盖矩形；换网格只确保目标包含源中心，
不确保目标矩形包含整个源区域。高程保留在 source；水平网格目标不携带高程，
其界不宣称覆盖三维高程误差。contains/intersects 只判断 region 矩形，不是圆的精确相交。

## CRS 与 URI 标准

geouri_parse、parse_location、parse_codes、CLI geouri/json 全部拒绝不支持的 CRS。
没有“先返回可用的 WGS84 LatLng 再提醒调用方”的低层例外。缺失 crs 或不区分大小写
的 wgs84 可接受；custom-grid、GCJ-02、EPSG 标签等均不擅自解释，不进行重投影。

geouri_format 和原始点的 to_geouri 保留已校验 URI 原文，包括坐标、高程、极小正 u、
显式 u=0 和扩展参数；避免六位坐标/三位 u 的固定舍入改变中心或把正数写成零。
CRS/u 重复、CRS/u 的错误顺序、扩展值非法百分号编码都被拒绝。
正 u 小到 Double 无法表示时直接拒绝，不悄悄下溢为零。
扫描器只去重相同原文，避免合并同坐标但不同 u/高程的对象。

依据：[RFC 5870 §3.4.1](https://www.rfc-editor.org/rfc/rfc5870.html#section-3.4.1)、
[§3.4.3](https://www.rfc-editor.org/rfc/rfc5870.html#section-3.4.3)、
[§3.7](https://www.rfc-editor.org/rfc/rfc5870.html#section-3.7)。

## 覆盖界的适用范围与推导

这是 WGS84 水平覆盖界，不是精密测地线、统计置信区间或传感器校准保证。
显式 u 是输入方的声明，库不验证该声明与实际观测是否一致。

WGS84 采用 a=6378137 m、1/f=298.257223563，令 e²=f(2-f)。
椭球度量的曲率半径为 `M=a(1-e²)/(1-e² sin²φ)^(3/2)`、
`N=a/sqrt(1-e² sin²φ)`；二者每度最大尺度均小于 111700 m。
沿线性变化的经纬度路径，纬向用 111700 上界，东西向用
`111700*cos(区域内最靠近赤道的纬度)` 上界，得到中心至单元任意点的覆盖界。
中心位移采用忽略 cos 收缩的更宽上界，故跨日期变更线也保守。
这些公式只用于界，resolution_m/area_m2 的近似值不参与界的证明。

显式 u 的包络采用 R=6335000 m，小于 WGS84 最小 M（约 6335439 m）；
相同经纬路径在此球面长度不大于椭球长度，因此球面距离 u 内的包络覆盖
椭球距离 u 内的点。到达极点覆盖全经度，大范围使用全世界包围盒。
输出网格中心取九位小数，额外增加 0.0002 m 及相对数值余量，并向外舍入 u。

参数来源：[NGA WGS84 定义](https://earth-info.nga.mil/?action=wgs84&dir=wgs84)。
上面的尺度与覆盖推导是本项目使用该参数作出的保守估计，不声称是精密距离算法。

## 0.5.0 迁移

这是明确的 0.x API 变更：

- 旧的 uncertainty_m: Double 改为 Double?，使用 match 区分 None/Some；禁止 unwrap_or(0) 当作实际准确度。
- 旧的 uncertainty_known 字段改为 uncertainty_known() 方法。
- 使用 cell_radius_m 查看网格自身尺寸，使用 uncertainty_m 查看位置覆盖界。
- GeoUri 不再在外部构造；通过 geouri_parse 验证输入，geouri_format 返回原文。
- 包外不能修改验证模型；应重新解析新输入或使用受支持的转换方法。
- CLI JSON 的 uncertainty_m 允许 null，crs 输出有效默认 "wgs84"，数值保留 Double 精度。

验证入口：`moon test --target js`、`moon run --target js examples/safety`、
`node scripts/check-semantics.mjs`。后者验证真实 JSON、转换输出、外部包正向访问，
以及外部伪造 Location/GeoUri 必须编译失败。四目标结果见 verification-results.json。
