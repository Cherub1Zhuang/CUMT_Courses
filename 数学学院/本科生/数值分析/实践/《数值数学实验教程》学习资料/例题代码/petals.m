%����1.1����:petals.m
theta=-pi:0.01:pi;  %�Ǵ�С              
rho(1,:)=2*sin(5*theta).^2; %��һ������
rho(2,:)=cos(10*theta).^3;%�ڶ�������
rho(3,:)=sin(theta).^2;%����������
rho(4,:)=5*cos(3.5*theta).^3;%���ĸ�����
for k=1:4
    polar(theta,rho(k,:));  
    pause;
end
