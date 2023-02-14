%例题1.1程序:petals.m
theta=-pi:0.01:pi;  %角大小              
rho(1,:)=2*sin(5*theta).^2; %第一个花瓣
rho(2,:)=cos(10*theta).^3;%第二个花瓣
rho(3,:)=sin(theta).^2;%第三个花瓣
rho(4,:)=5*cos(3.5*theta).^3;%第四个花瓣
for k=1:4
    polar(theta,rho(k,:));  
    pause;
end
