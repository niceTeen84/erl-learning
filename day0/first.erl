-module(first).
-export([double/1, mult/2, fac/1, convert/2, convert_length/1]).
% 参数大写
% 导出时 / 后面的数字是参数数量
% 如果函数名冲突，需要加上 module_name:function()

mult(X, Y) -> 
  X * Y.

double(X) -> 
  mult(X, 2).

% 阶乘函数 ; 表示还有同名函数继续定义
fac(1) ->
	1;

% 递归阶乘 . 表示该函数没有其他定义
fac(N) -> 
	N * fac(N - 1).

% Atom 数据类型, 与变量参数不同，它是小写格式
% c(first).
% first:convert(100, mile).
% first:convert(100, centermeter).
convert(M, mile) ->
	M / 1800;

% 我感觉这有点儿像是模式匹配 pattern match
% inch 会报错
convert(N, centermeter) ->
	N * 2.54.

% 上述写法语意性不强
% 元组 Tuples 是为了增强表达性
convert_length({centimeter, X}) ->
	{inch, X / 2.54};

% first:convert_length({inch, 5}).
% output {centimeter,12.7}
% 可读性比上述要强很多
convert_length({inch, Y}) ->
	{centimeter, Y * 2.54}.

% first:convert_length(first:convert_length({inch, 5})).
% {moscow, {c, -10}}
% {cape_town, {f, 70}}
% {paris, {f, 28}}