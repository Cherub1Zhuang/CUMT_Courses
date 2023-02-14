%牛顿迭代法函数模块：cnewton_interation_rule.m 
function [x,kx]=cnewton_interation_rule(f,df,x0,epsilon,N)
%　用newton迭代法求f(x)=0的根。
%　输入：函数句柄@f，导函数句柄@df。
%　精度epsilon，最大迭代次数N。
% 输出：近似根，迭代过程中数据矩阵kx
f=fcnchk(f);
df=fcnchk(df);

%进行迭代，一旦满足停机标准则停止迭代
e=1;k=0;kx=[0,x0];
if abs(feval(f,x0))<=epsilon
    x=x0;
    error('x0就是根！');
end
while e>epsilon & k<=N & abs(feval(f,x0))>epsilon
    k=k+1;
    x=x0-feval(f,x0)/feval(df,x0); %进行一步newton迭代
    kx=[kx;k,x];
    e=abs(x-x0);
    x0=x;
end
if k>N & e>epsilon
    warning('Newton迭代法达到最大迭代次数根没有达到精度要求！');
end
