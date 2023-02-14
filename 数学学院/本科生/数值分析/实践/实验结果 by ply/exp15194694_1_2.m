% fdhstx2.m
function fdhstx2
yy=[0,1,2];
zz=F(yy);
y=-1:0.01:3;
z=F(y);
figure('color','white');
hold on;
plot(y,z,'k-','LineWidth',2);
stem(yy,zz,'k--');
axis([-1,3,0,1]);
hold off;


function z=F(y)
z=zeros(size(y));
l1=y<0;
l2=y>=0&y<=1;
l3=y>1&y<2;
l4=y>=2;
z(l1)=0;
z(l2)=0.5;
z(l3)=0.75;
z(l4)=1;
