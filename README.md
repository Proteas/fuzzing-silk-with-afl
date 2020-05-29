# Fuzzing SILK with AFL
前段时间 `Fuzz` 了一下 `SILK` 库，<br/>
跑出不少崩溃，但是还没做详细的崩溃分析。<br/>
有很多程序使用了 `SILK` 库，<br/>
但是有的程序只是使用了其中的编码、解码这 2 个接口，<br/>
并且配置为只编解码单帧，这极大的降低了针对 `SILK` 的攻击面。<br/>
这里跟大家简单介绍下如何使用 `AFL` `Fuzz` `SILK`。<br/>

## SILK 代码
`SILK` 是一个语音编解码库，被很多程序使用。<br/>
* https://github.com/gaozehua/SILKCodec/tree/master/SILK_SDK_SRC_FIX

## 编译
* 将 `Makefile` 拷贝到 `SILK_SDK_SRC_FIX` 覆盖原始的 `Makefile`。
* 将 `build.sh` 拷贝到 `SILK_SDK_SRC_FIX`。
* 修改 `build.sh` 中的 `PATH_OF_AFL` 指向正确的路径。
* `cd` 到 `SILK_SDK_SRC_FIX` 执行：`./build.sh`。

## Fuzzing
* 根据 `AFL` 的说明文档，配置 `Fuzzer`，进行 `Fuzz`。
* 也可以使用已经配置好的 `Fuzzer`：`fuzzer-decoder`。
  * `cd fuzzer-decoder`
  * `./do-fuzzing.sh`

## Fuzz 结果
`fuzz-result` 里面是已经跑出来的崩溃，<br/>
这里采用的 `parallel` 模式，<br/>
大家也可以参考 `AFL` 文档中的 `parallel_fuzzing.txt` 配置进行并行 `Fuzz`。<br/>
没有做过精简的 `Fuzz` 结果如下，共 356 个崩溃：
* `fuzz-result/crashes-01`: 65 个崩溃。
* `fuzz-result/crashes-02`: 91 个崩溃。
* `fuzz-result/crashes-03`: 96 个崩溃。
* `fuzz-result/crashes-04`: 104 个崩溃。

## 题外话
安全有对抗属性，说得高大上是战略上的事情，关键还是要看战术执行能力，否则就会像 “雷雷师傅” “马师傅”。

# Contact
* https://twitter.com/ProteasWang
* http://weibo.com/proteaswang
