function eg9_42
%例题9.4第二个主程序，eg9_42.m
mu=10000;mustr=num2str(mu);
h=0.1;
u0=[2,0]';tspan=0:h:5*mu;
[t,u] = ode23s(@f,tspan,u0,[],mu)

figure('color','white');
hold on;
plot(t,u(:,1),'-k','linewidth',1.5);
%plot(t,u(:,2),'--k','linewidth',1);
title(['当','\mu=',mustr,'时数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

function dudt=f(t,u,mu)
dudt=[u(2),mu*(1-u(1)^2)*u(2)-u(1)]';
