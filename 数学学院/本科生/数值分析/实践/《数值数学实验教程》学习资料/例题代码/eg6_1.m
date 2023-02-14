function eg6_1
%例题6.1主程序：eg6_1.m
load b6_2.mat
xi = min(x):.25:max(x); 
%yi=clagrange_interp(x,y,xi);
[yi,A]=cnewton_interp(x,y,xi); 
figure('color','white');
hold on
plot(xi,yi,'ko--','LineWidth',1); %插值函数
plot(xi,sin(sin(xi)),'k-','LineWidth',2); %实际函数
axis([min(x),max(x),-1.1,1.1]); 
title('近似图像（虚线）');
hold off
