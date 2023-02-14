function lnh
n=100;
h=2/n;
x=-1:h:1;
y=10./(1+25*x.^2)+0.1*randn(size(x));
save('exp15194694_7.mat','x','y');
dxs(2);
dxs(5);
dxs(9);
[fit22,gof2,out2]= fit(x',y','a./(b+c*x.^2)')

figure('color','white');
title('用自定义模型拟合');
hold on;
plot(x,y,'*');
x=min(x):0.01:max(x);
y2=feval(fit22,x);
plot(x,y2,'k-');
hold off;

function dxs(n)
load exp15194694_7.mat
a=polyfit(x,y,n) 

xx=-1:0.05:1;
y1=zeros(size(xx));
for k =0:n
    y1=y1+a(k+1)*xx.^(n-k);
end
figure('color','white');
title([num2str(n),'次多项式拟合']);
hold on;
plot(x,y,'*');
plot(xx,y1,'k-');
hold off;