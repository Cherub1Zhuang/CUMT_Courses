%例题1.10程序：mdfht.m 
function mdfht
%要求函数值的点很多，用一个向量来表示。
x=-3:0.01:3;
%调用一次函数可以求多个实数的函数值
y=f(x);
%用描点法绘制图象
plot(x,y,'k-','LineWidth',2);

function y=f(x)
y=0.5*x.*exp(-x.^2/4);
