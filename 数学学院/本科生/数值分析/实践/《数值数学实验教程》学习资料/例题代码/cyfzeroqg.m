%例题4.8主程序：cyfzeroqg.m
function cyfzeroqg
x=-1:0.01:3;
y=f(x);
figure('color','white');
hold on;
plot(x,y,'k-');         %绘制图像
fplot(@xf,[-1,3],'k--');
hold off;
x=fzero(@f,[0,3])  %求在指定区间内的零点

function y=f(x)
y=(x-1).^2.*sin(x+1);

function y=xf(x)
y=zeros(size(x));
