% fdhstx1.m
function fdhstx1
yy=[0,pi/4,1]; %�ֶε�
zz=F(yy);
%��������õ��Ա���
y=-1:0.01:2;
%����ֵ
z=F(y);
figure('color','white');
hold on;
plot(y,z,'k-','LineWidth',2);
stem(yy,zz,'k--');
axis([-1,2,0,1]);
hold off;
function z=F(y)
z=zeros(size(y));
%���߼��±�
l1=y<=0;
l2=y>0&y<pi/4;
l3=y>=pi/4&y<1;
l4=y>=1;
%���߼��±�����ֵ
z(l1)=0;
z(l2)=sin(y(l2));
z(l3)=y(l3);
z(l4)=1;
