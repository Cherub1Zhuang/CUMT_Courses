function eg6_4
%例题6.4主程序：eg6_4.m
%用切比雪夫多项式零点进行高次插值
%求切比雪夫多项式零点
n=20;x=zeros(1,n+1);
for i=1:n+1
    x(i)=cos((2*(i-1)+1)*pi/(2*(n+1)));
end
%求节点处函数值并取四位有效数字
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;

%Lagrange插值法
xx=-1:0.05:1;%预测点
yy=clagrange_interp(x,y,xx);
figure('color','white') ;
title([num2str(n+1),'个雪夫多项式零点Lagrange插值']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'k--');
hold off;

%Newton插值法
xx=-1:0.05:1;%预测点
yy=cnewton_interp(x,y,xx);
figure('color','white') ;
title([num2str(n+1),'个雪夫多项式零点Newton插值']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'k--');
hold off;

function y=f(x)
y=1./(1+25*x.^2);
