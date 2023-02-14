function eg9_1
%����9.1������eg9_1.m
h=0.1;
u0=[0.4,0,0,2];
a=0;b=5;tspan=a:h:b;

[t,u]=ode45(@fl,tspan,u0);
E=codeivp_euler_ruler(@f,[a,b],h,u0);
ME=codeivp_modified_euler_rule(@f,[a,b],h,u0);
RK=codeivp_rk4_rule(@f,[a,b],h,u0);
[YA,FA,YBAR,FBAR]=codeivp_AdamsPECE_rule(@f,[a,b],h,u0);
[YAP,FAP,P,C,M]=codeivp_AdamsPMECME_rule(@f,[a,b],h,u0);
disp(['�ڵ� ',' ode45��x(t) ',' ode45��y(t )',' Euler��x(t) '...
    ,' Euler��y(t) ',' �Ľ�Euler��x(t) ',' �Ľ�Euler��y(t) ']);
[t,u(:,1:2),E(:,2:3),ME(:,2:3)]
disp(['�ڵ� ',' RK��x(t) ',' RK��y(t) ',' AdamsPECE��x(t) '...
    ,' AdamsPECE��y(t) ',' AdamsPMECME��x(t) ',' AdamsPMECME��y(t) ',]);
[t,RK(:,2:3),YA(:,2:3),YAP(:,2:3)]

figure('color','white');
hold on;
plot(t,u(:,1),'-k','linewidth',1);
plot(t,u(:,2),'--k','linewidth',1);
title(['ode45������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,E(:,2),'-k','linewidth',1);
plot(t,E(:,3),'--k','linewidth',1);
title(['Euler��������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,ME(:,2),'-k','linewidth',1);
plot(t,ME(:,3),'--k','linewidth',1);
title(['�Ľ�Euler��������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,RK(:,2),'-k','linewidth',1);
plot(t,RK(:,3),'--k','linewidth',1);
title(['RK��������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,YA(:,2),'-k','linewidth',1);
plot(t,YA(:,3),'--k','linewidth',1);
title(['AdamsPECE��������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;

figure('color','white');
hold on;
plot(t,YAP(:,2),'-k','linewidth',1);
plot(t,YAP(:,3),'--k','linewidth',1);
title(['AdamsPMECME��������ֵ��']);
xlabel('time t');
ylabel('solution u');
hold off;


function dudt=fl(t,u)
%ode45Ҫ����ֵ����������
r=sqrt(u(1)^2+u(2).^2);
dudt=[u(3),u(4),-u(1)./r^3,-u(2)./r^3]';

function dudt=f(t,u)
%���غ���ֵ�������������Զ��庯��ģ��
r=sqrt(u(1)^2+u(2).^2);
dudt=[u(3),u(4),-u(1)./r^3,-u(2)./r^3];


