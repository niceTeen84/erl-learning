-module(data_type).
-export([foo/1, list_len/1]).

foo(Name) -> 
    io:format(Name).

list_len([]) ->
    0;
% 集合长度 length 用递归方式计算
% 这里会报 First 参数未使用。
% 官文说明这里没有进行尾递归优化。
list_len([First | Rest]) ->
    1 + list_len(Rest).

% Map 数据结构
% 用 #{} 这种方式声明