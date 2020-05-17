# erl-learning
* 第一步 `brew install erlang`
   * `echo 'export PATH="/usr/local/opt/erlang@21/bin:$PATH"' >> ~/.zshrc` 设置环境变量。
   * man 保存在 `/usr/local/opt/erlang@21/lib/erlang/man` 路径下面。
* erlang 语言有一个 REPL 只要配置好环境变量，输入 `erl` 即可进入。
   * `erl -init_debug` 可以显示 REPL 启动过程。
   * REPL 内 `c(module_name).` 这个方法用来编译 erl 程序文件。
   * 每个 erl 文件开头都会有 `-module(xxx)` 和 `-export([function/1])` 两行。
   * `erl -man module_name`用来查看模块文档。
 
