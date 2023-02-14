function eg6_4
%����6.4������eg6_4.m
%���б�ѩ�����ʽ�����иߴβ�ֵ
%���б�ѩ�����ʽ���
n=20;x=zeros(1,n+1);
for i=1:n+1
    x(i)=cos((2*(i-1)+1)*pi/(2*(n+1)));
end
%��ڵ㴦����ֵ��ȡ��λ��Ч����
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;

%Lagrange��ֵ��
xx=-1:0.05:1;%Ԥ���
yy=clagrange_interp(x,y,xx);
figure('color','white') ;
title([num2str(n+1),'��ѩ�����ʽ���Lagrange��ֵ']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'k--');
hold off;

%Newton��ֵ��
xx=-1:0.05:1;%Ԥ���
yy=cnewton_interp(x,y,xx);
figure('color','white') ;
title([num2str(n+1),'��ѩ�����ʽ���Newton��ֵ']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'k--');
hold off;

function y=f(x)
y=1./(1+25*x.^2);
