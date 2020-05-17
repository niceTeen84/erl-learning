-module(color).
-export([new/4, blend/2]).
% erlang 语言有宏概念
% 这个宏用来检查 color 的初始值是否是规定的浮点数。
-define(is_channel(V), (is_float(V) andalso V >= 0.0 andalso V =< 1.0)).

% 颜色的构造函数
% when 后面的卫语句用来进行参数校验
% => 操作符出现在新初始化的 Map 语句内
new(R, G, B, A) when ?is_channel(R), ?is_channel(G),
                     ?is_channel(B), ?is_channel(A) ->
    #{red => R, green => G, blue => B, alpha => A}.

% 混合 RGB 颜色
% 向外暴露的函数只有两个传递参数
blend(Src, Dst) ->
    blend(Src, Dst, alpha(Src, Dst)).

% 参数后 when 用来判断 alpha 值的合法性
blend(Src, Dst, Alpha) when Alpha > 0.0 ->
    Dst#{
        red := red(Src, Dst) / Alpha,
        green := green(Src, Dst) / Alpha,
        blue := blue(Src, Dst) / Alpha,
        alpha := Alpha
    };

% 当 source 参数 和 alpha 缺失 返回默认 Map
blend(_, Dst, _) ->
    Dst#{
        red := 0.0,
        green := 0.0,
        blue := 0.0,
        alpha := 0.0
    }.
% 计算混合后的 alpha 值
% := 操作符用来获取 Map 中的 val
% eg. #{key_name := param_name}
alpha(#{alpha := SA}, #{alpha := DA}) -> 
    SA + DA*(1.0 - SA).

red(#{red := SV, alpha := SA}, #{red := DV, alpha := DA}) -> 
    SV*SA + DV*DA*(1.0 - SA).
green(#{green := SV, alpha := SA}, #{green := DV, alpha := DA}) -> 
    SV*SA + DV*DA*(1.0 - SA).
blue(#{blue := SV, alpha := SA}, #{blue := DV, alpha := DA}) -> 
    SV*SA + DV*DA*(1.0 - SA).