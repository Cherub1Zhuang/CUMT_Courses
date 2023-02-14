function eg9_42
%����9.4�ڶ���������eg9_42.m
mu=10000;mustr=num2str(mu);
h=0.1;
u0=[2,0]';tspan=0:h:5*mu;
[t,u] = ode23s(@f,tspan,u0,[],mu)

figure('color','white');
hold on;
plot(t,u(:,1),'-k','linewidth',1.5);
%plot(t,u(:,2),'--k','linewidth',1);
title(['��','\mu=',mustr,'ʱ��ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

function dudt=f(t,u,mu)
dudt=[u(2),mu*(1-u(1)^2)*u(2)-u(1)]';
