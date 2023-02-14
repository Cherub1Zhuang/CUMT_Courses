function bfwt
%例题3.3主程序：bfwt.m
x=-0.5:0.01:1.5
u=sin(x)/sin(1)-x;
u1=5*x.*(1-x)/18;
u2=x.*(1-x).*(7*x/41+71/369);

figure('color','white');
hold on
plot(x,u,'k-','LineWidth',1);
plot(x,u2,'k--','LineWidth',2);
title('二维近似解')
hold off
