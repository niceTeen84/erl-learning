-module(tut1).
-export([say/0, format_temps/1]).

% format 第一个参数是输出摸板， 第二个参数是 list 数据类型
% ~w 表示字符串，~n 表示换行
say() ->
    io:format("this is ~w ~w~n", [rbw, allen]).

format_temps([]) ->
    ok;
% [{moscow, {c, -10}}, {cape_town, {f, 70}}, {stockholm, {c, -4}}, {paris, {f, 28}}, {london, {f, 36}}]
% test data
% f(). 可以清除设定好的变量
format_temps([City | Rest]) ->
    print_temp(convert_to_celsius(City)),
    format_temps(Rest).

% 摄氏度不转换返回原值
convert_to_celsius({Name, {c, Temp}}) ->
    {Name, {c, Temp}};
% 华氏度转换为摄氏度
convert_to_celsius({Name, {f, Temp}}) -> 
    {Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) -> 
    io:format("~-15w ~w c~n", [Name, Temp]).