function eg9_3
%例题9.3主程序：eg9_3.m
h=0.1;
%y0=1;tspan=0:h:8;
y0=3;tspan=4:h:12;
[t,y] = ode45(@f,tspan,y0);
[t,y]
figure('color','white');
hold on;
plot(tspan,y,'--k','linewidth',1.5);
plot(tspan,fu(tspan),'-k','linewidth',1.5);
title('初值问题（9.53）');
xlabel('time t');
ylabel('solution u');
legend('numerical solutons','true solutions');

function dudt=f(t,u)
dudt=u-2*t./u;

function u=fu(t)
u=sqrt(1+2*t);
