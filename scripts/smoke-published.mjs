// Install the exact published version into an isolated consumer and exercise
// only public APIs. This command reads the registry; it never publishes a module.
import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const version = fs.readFileSync(path.join(root,'moon.mod'),'utf8').match(/version\s*=\s*"([^"]+)"/)[1];
const directory = path.join(root,'.cache/published-consumer');
fs.mkdirSync(path.join(directory,'main'),{recursive:true});
fs.rmSync(path.join(directory,'moon.mod.json'),{force:true});
fs.rmSync(path.join(directory,'main/moon.pkg.json'),{force:true});
fs.writeFileSync(path.join(directory,'moon.mod'),
  'name = "acceptance/geocodec-consumer"\n\nversion = "0.0.0"\n\nimport {\n'+
  `  "sssssurf/geocodec@${version}",\n}\n`);
fs.writeFileSync(path.join(directory,'main/moon.pkg'),
  'import {\n  "sssssurf/geocodec",\n}\n\noptions(\n  "is-main": true,\n)\n');
fs.copyFileSync(path.join(root,'examples/safety/main.mbt'),path.join(directory,'main/main.mbt'));
const updateLog = path.join(directory,'registry-update.log');
const updateFd = fs.openSync(updateLog,'w');
let updateResult;
try {
  updateResult = spawnSync('moon',['update'],{
    cwd:directory,stdio:['ignore',updateFd,updateFd],
  });
} finally { fs.closeSync(updateFd); }
if (updateResult.error || updateResult.status !== 0) {
  console.error(updateResult.error?.message ?? fs.readFileSync(updateLog,'utf8'));
  process.exit(1);
}
const outputPath = path.join(directory,'output.log');
const fd = fs.openSync(outputPath,'w');
let result;
try {
  result = spawnSync('moon',['run','--target','js','main'],{
    cwd:directory,stdio:['ignore',fd,fd],
  });
} finally { fs.closeSync(fd); }
const output = fs.readFileSync(outputPath,'utf8').replace(/\r\n/g,'\n');
const expected = fs.readFileSync(path.join(root,'examples/safety/expected.txt'),'utf8').trim();
const start = output.indexOf('unknown_is_none: ');
if (result.error || result.status !== 0 || output.slice(start).trim() !== expected) {
  console.error(result.error?.message ?? output);
  process.exit(1);
}
const treeLog = path.join(directory,'dependency-tree.json');
const treeFd = fs.openSync(treeLog,'w');
let treeResult;
try {
  treeResult = spawnSync('moon',['tree','--json'],{
    cwd:directory,stdio:['ignore',treeFd,treeFd],
  });
} finally { fs.closeSync(treeFd); }
if (treeResult.error || treeResult.status !== 0) {
  throw new Error('Could not verify the consumer dependency graph');
}
const tree = JSON.parse(fs.readFileSync(treeLog,'utf8'));
const installed = tree.modules?.find(m=>m.name==='sssssurf/geocodec');
if (tree.status !== 'success' || installed?.version !== version || installed?.source?.kind !== 'registry') {
  throw new Error('Expected the exact registry version with no local path override');
}
const report = { date:new Date().toISOString(),module:'sssssurf/geocodec',version,
  source:'Mooncakes registry dependency in a separate module; no local path override',
  status:'passed', resolvedVersion:installed.version,
  output:output.slice(start).trim().split('\n') };
fs.writeFileSync(path.join(directory,'report.json'),JSON.stringify(report,null,2)+'\n');
console.log(`Published consumer passed: sssssurf/geocodec@${version}`);
console.log(report.output.join('\n'));
