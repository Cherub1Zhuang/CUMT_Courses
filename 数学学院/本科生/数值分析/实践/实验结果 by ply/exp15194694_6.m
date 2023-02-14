function lcz
n=100;
x=2*sort(rand(1,n))-1;
sort(x);
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;
dy1=df(x);dy1int=floor(dy1);
dy1=dy1int+round(10000*(dy1-dy1int))/10000;
save('exp15194694_6.mat','x','y','dy1');

%Lagrange插值
xx=-1:0.01:1;  
yy=clagrange_interp(x,y,xx); 
figure('color','white');
title([num2str(n),'次Lagrange插值多项式']);
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%分段线性插值
xx=-1:0.01:1; %预测点
yy=cpiece_linear_interp(x,y,xx);
figure('color','white');
title([num2str(n+1),'个等距节点分段线形插值']); 
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%构造分段三次Hermite插值多项式
xx=-1:0.01:1; %预测点
yy=cpiece3_hermite_interp(x,y,dy1,xx);
figure('color','white');
title([num2str(n+1),'个等距节点分段三次Hermite插值']);
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%构造三次样条插值多项式
condnum=1;condval=[50/(1+25)^2,-50/(1+25)^2];
xx=-1:0.01:1; %预测点
yy=cspline3_interp1(x,y,condnum,condval,xx);
figure('color','white');
title([num2str(n+1),'个等距节点三次样条插值']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'r');
hold off;

function y=f(x)
y=1./(1+25*x.^2);

function y=df(x)
y=-50*x./(1+25*x.^2).^2;
