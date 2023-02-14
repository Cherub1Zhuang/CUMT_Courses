%求自定义计算机数系的函数模块：cfloat_number_sys.m 
function [A,DA]=cfloat_number_sys(p,L,U)
%输入:小数位数即精度p,指数范围L,U
%输出:规格化浮点数矩阵A,第一行正数第二行负数
%输出:非规格化浮点数矩阵DA,第一行正数第二行负数
S=[1,-1];e=L:U;E=2.^e;
d=0:2^p-1;D=d*2^(-p);

%用kron函数求每个规格化、非规格化浮点数
A=kron(kron(S',E),(1+D));  % 规格化浮点数
DA=kron(S,D)*2^L;       % 非规格化浮点数
