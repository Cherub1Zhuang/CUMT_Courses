function eg9_41
%����9.4��һ��������eg9_41.m
mu=0;
mustr=num2str(mu);
h=0.1;
u0=[2,0]';tspan=0:h:20;
[t,u]=ode45(@f,tspan,u0,[],mu)

figure('color','white');
hold on;
plot(t,u(:,1),'-k','linewidth',1.5);
plot(t,u(:,2),'--k','linewidth',1);
title(['��','\mu=',mustr,'ʱ��ֵ�⣨ʵ�ߣ�']);
xlabel('time t');ylabel('solution u');
hold off;

function dudt=f(t,u,mu)
dudt=[u(2),mu*(1-u(1)^2)*u(2)-u(1)]';
