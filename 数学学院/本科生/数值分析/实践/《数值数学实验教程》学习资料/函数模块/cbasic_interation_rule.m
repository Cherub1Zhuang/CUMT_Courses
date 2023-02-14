%基本迭代法函数模块：cbasic_interation_rule.m
function [x,kx]=cbasic_interation_rule(f,fai,x0,epsilon,N)
%函数方程f(x)=0的迭代函数x=fai(x)的基本迭代法程序。
%输入：函数方程中函数句柄@f,迭代函数句柄@fai，初值x0.
%精度epsilon　，最大迭代次数N。
%输出：近似根x ,迭代中间值矩阵kx，
%第一列为迭代次数，第二列为近似根。
f=fcnchk(f);
fai=fcnchk(fai);

%为迭代准备初值
e=1;k=0;kx=[0,x0];
%开始迭代
if abs(feval(f,x0))<=epsilon
    x=x0;
    error('x0就是根！');
end
while e>epsilon & k<=N & abs(feval(f,x0))>epsilon
    k=k+1;
    x=feval(fai,x0);
    kx=[kx;k,x];
    e=abs(x0-x);
    x0=x;
end
if k>N 
    warning('已经超过最大迭代次数，输出的根未达到精度要求。');
end
