%例题4.10主程序：czfjg3.m 
function czfjg3
x0=[-5,-5];
[x,fx,tag]=fsolve(@f,x0)

function y=f(x) %自定义二元函数
y=zeros(size(x));
y(1)=2*x(1)-x(2)-exp(-x(1));
y(2)=-x(1)+2*x(2)-exp(-x(2));
