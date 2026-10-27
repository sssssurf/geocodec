# 地点统一模型与转换损失

Geohash、Plus Code 和 Maidenhead 表示区域单元；十进制坐标、度分秒和
`geo:` URI 表示坐标点。统一的是查询接口，原生语义通过 `kind` 保留。

| 字段 | 语义 |
| --- | --- |
| format / kind | 原始记法；Cell 或 Point |
| point | 单元中心或原坐标；不是整个地点信息 |
| region | 精确单元边界、显式 u 的保守矩形包络，或退化坐标点 |
| resolution_m | 单元较长边的近似米数；带 u 的点为 2u；未给出范围时为 0 |
| uncertainty_m | 单元中心的保守覆盖半径，或原文明确提供的 u；未知时数值占位为 0 |
| uncertainty_known | 区分未指定准确度与显式 u=0；单元有已知几何覆盖界 |
| area_m2 | 单元近似面积或 u 包络的名义面积；不是精确椭球面积 |
| altitude_m / crs | 原 geo URI 的高程和坐标系标记 |
| raw | 解析文本，去掉外侧空白；转换记录保留源文本 |

不变量：解析得到的 region 包含 point；Cell 的 region 是该码的精确单元。
Point 未给 u 时不推测测量准确度：数值占位 0 不等于实际误差为 0。
u=0 则是显式零不确定度，序列化保留它。u 包络的 contains/intersects 是
矩形包络判断，不是圆形不确定区域的精确相交运算。

## 转换会丢失什么

| 转换 | 保留与损失 | 使用方式 |
| --- | --- | --- |
| 单元 → center() | 返回代表点；单独使用会丢失区域形状与范围 | 保留原 Location |
| 单元 → geo URI | 保留中心与向外舍入的覆盖半径；矩形变为圆，丢失形状 | to_geouri() |
| 点 → 单元 | 量化到包含代表点的单元，丢失精确坐标；单元尺寸不代表源测量准确度 | convert_to_cell() |
| 点 + u → 更细单元 | 源 u 不会因编码变细而减小 | 转换记录保留 source 与传播后的界 |
| 单元 → 不同网格 | 目标单元包含源中心，但不保证覆盖源单元 | 保留 source.region |
| 未知准确度的点 → 单元 | 可以确定目标几何范围，不能发明源准确度 | uncertainty_bound_m 为 None |

`to_cell` 是低层代表点量化函数，返回目标 Location。需要保留转换来源时，
使用 `convert_to_cell`，返回 `LocationConversion`：

- source：完整源 Location，包括原文、区域、u、高程；
- target：目标单元，描述目标网格自身的几何范围；
- center_shift_bound_m：源代表点到目标中心的保守距离界；
- uncertainty_bound_m：源 u 加中心位移界；源准确度未指定时为 None。

例如 `geo:48.198634,16.371648;u=40` 转为 10 位 Plus Code：
target 是 `8FWR59XC+FM`，单元较长边约 13.822 m，几何覆盖半径约 8.390 m；
source 的 40 m 不确定度仍保留，围绕新中心传播后的界约为 47.428 m。
不能把目标的 8.390 m 当成原地点的准确度。

## 数值与标准边界

单元尺寸与面积使用近似地面尺度；覆盖半径用 111700 m/度作为 WGS84
方向尺度的保守上界，并使用区域内最大的纬线尺度。它是覆盖界，不是精密
椭球测地距离。geo URI 输出使用 9 位坐标、小数半径向外舍入，并给坐标
舍入位移留出余量，避免高精度单元转 URI 后半径反而不足。

显式 u 的矩形包络以小于 WGS84 最小曲率半径的 6,335,000 m 球体构造保守
角范围；到达极点时覆盖全部经度。点 geo URI 保留原文，避免缩短输入精度。
统一模型只解释 WGS84：未知 CRS 在 `parse_location` 中返回 None；低层
`geouri_parse` 可保留合法 CRS 标签供调用方处理，不进行重投影。

规范依据：[RFC 5870 §3.4.3](https://www.rfc-editor.org/rfc/rfc5870.html#section-3.4.3)
区分缺失 u 与显式 u 值；本库不会把二者合并成“精确位置”。

## 可验证证据

`location_test.mbt` 覆盖模型分类、包含关系、u=0 与未知准确度、源准确度传播、
不支持 CRS、极点包络，以及 2/6/10/15 位 Plus Code 转 URI 后四角仍在包络内。
`geo_math_test.mbt` 还覆盖极大有限经度的归一化，避免循环无法取得进展。
实际输出见 [reproducible-demo.md](reproducible-demo.md)。
