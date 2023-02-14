function eg9_5
%例题9.5主程序:eg9_5.m
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);
tspan=[0,12];y0=[0,1,1];
[T,Y] = ode45(@rigid,[0 12],[0 1 1],options);
[T,Y]

figure('color','white');
plot(T,Y(:,1),'-k',T,Y(:,2),'k-.',T,Y(:,3),'k.')
xlabel('时间 t');ylabel('解 y(t)');
legend('数值解y_1(t)','数值解y_2(t)','数值解y_3(t)');

function dy = rigid(t,y)
dy = zeros(3,1);    
dy(1) = y(2) * y(3);
dy(2) = -y(1) * y(3);
dy(3) = -0.51 * y(1) * y(2);
