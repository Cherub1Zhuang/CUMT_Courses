function wffcszjf 
a=0;b=5;h=1/64;u=[3,1]; 
t=a:h:b;t=t'; 
E=codeivp_euler_ruler(@f,[a,b],h,u); 
ME=codeivp_modified_euler_rule(@f,[a,b],h,u); 
RK=codeivp_rk4_rule(@f,[a,b],h,u); 
disp(['节点','欧拉法 x(t)','欧拉法 y(t)']); 
[t,RK(:,2:3),E(:,2:3),ME(:,2:3)] 
save('exp15194694_9.mat','E','ME','RK') 
figure('color','white'); 
hold on; 
plot(t,E(:,2),'-k','linewidth',1); 
plot(t,E(:,3),'--k','linewidth',1); 
xlabel('t'); ylabel('v'); 
hold off;
figure('color','white'); 
hold on; 
plot(t,ME(:,2),'-k','linewidth',1); 
plot(t,ME(:,3),'--k','linewidth',1); 
xlabel('t');ylabel('u'); 
hold off; 
figure('color','white'); 
hold on; 
plot(t,RK(:,2),'-k','linewidth',1); 
plot(t,RK(:,3),'--k','linewidth',1); 
xlabel('t');ylabel('u'); 
title(['RK法结果']); 
hold off; 
function dudt=f(t,v) 
dudt=[4.*v(1)-2.*v(1).*v(2),v(1).*v(2)-3*v(2)];