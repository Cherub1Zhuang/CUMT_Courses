%����1.12������fdhstx.m
function fdhstx
yy=[0,1,4]; %�ֶε�
zz=F(yy);
%��������õ��Ա���
y=-2:0.1:6;
%����ֵ
z=F(y);
figure('color','white');
hold on;
plot(y,z,'k-','LineWidth',2);
stem(yy,zz,'k--');
axis([-3,7,-0.5,1.5]);
hold off;

function z=F(y)
z=zeros(size(y));
%���߼��±�
l1=y<0;
l2=y>=0 & y<1;
l3=y>=1 & y<4;
l4=y>=4;
%���߼��±�����ֵ
z(l2)=2/3*sqrt(y(l2));
z(l3)=(sqrt(y(l3))+1)/3;
z(l4)=1;
