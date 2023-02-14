function eg9_1
%例题9.1主程序：eg9_1.m
h=0.1;
u0=[0.4,0,0,2];
a=0;b=5;tspan=a:h:b;

[t,u]=ode45(@fl,tspan,u0);
E=codeivp_euler_ruler(@f,[a,b],h,u0);
ME=codeivp_modified_euler_rule(@f,[a,b],h,u0);
RK=codeivp_rk4_rule(@f,[a,b],h,u0);
[YA,FA,YBAR,FBAR]=codeivp_AdamsPECE_rule(@f,[a,b],h,u0);
[YAP,FAP,P,C,M]=codeivp_AdamsPMECME_rule(@f,[a,b],h,u0);
disp(['节点 ',' ode45法x(t) ',' ode45法y(t )',' Euler法x(t) '...
    ,' Euler法y(t) ',' 改进Euler法x(t) ',' 改进Euler法y(t) ']);
[t,u(:,1:2),E(:,2:3),ME(:,2:3)]
disp(['节点 ',' RK法x(t) ',' RK法y(t) ',' AdamsPECE法x(t) '...
    ,' AdamsPECE法y(t) ',' AdamsPMECME法x(t) ',' AdamsPMECME法y(t) ',]);
[t,RK(:,2:3),YA(:,2:3),YAP(:,2:3)]

figure('color','white');
hold on;
plot(t,u(:,1),'-k','linewidth',1);
plot(t,u(:,2),'--k','linewidth',1);
title(['ode45所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,E(:,2),'-k','linewidth',1);
plot(t,E(:,3),'--k','linewidth',1);
title(['Euler法所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,ME(:,2),'-k','linewidth',1);
plot(t,ME(:,3),'--k','linewidth',1);
title(['改进Euler法所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,RK(:,2),'-k','linewidth',1);
plot(t,RK(:,3),'--k','linewidth',1);
title(['RK法所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,YA(:,2),'-k','linewidth',1);
plot(t,YA(:,3),'--k','linewidth',1);
title(['AdamsPECE法所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,YAP(:,2),'-k','linewidth',1);
plot(t,YAP(:,3),'--k','linewidth',1);
title(['AdamsPMECME法所求数值解']);
xlabel('time t');
ylabel('solution u');
hold off;


function dudt=fl(t,u)
%ode45要求函数值返回列向量
r=sqrt(u(1)^2+u(2).^2);
dudt=[u(3),u(4),-u(1)./r^3,-u(2)./r^3]';

function dudt=f(t,u)
%返回函数值是行向量用于自定义函数模块
r=sqrt(u(1)^2+u(2).^2);
dudt=[u(3),u(4),-u(1)./r^3,-u(2)./r^3];


