function eg6_3
%����6.3������: eg6_3.m��
%ʵ���ֵ�������̬

%ȡ����[-1,1] �ϵĵȾ�ڵ�
%��Ϊ��ֵ�ڵ����Lagrange��ֵ
n=10;h=2/n;x=-1:h:1;
%��ڵ㴦����ֵ��ȡ��λ��Ч����
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;
xx=-1:0.05:1;  %Ԥ���
yy=clagrange_interp(x,y,xx); 
figure('color','white');
title([num2str(n),'��Lagrange��ֵ����ʽ']);
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%����ֶ����Բ�ֵ����ʽ
n=10;h=2/n;x=-1:h:1;
%��ڵ㴦����ֵ��ȡ��λ��Ч����
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;
xx=-1:0.05:1; %Ԥ���
yy=cpiece_linear_interp(x,y,xx);
figure('color','white');
title([num2str(n+1),'���Ⱦ�ڵ�ֶ����β�ֵ']); 
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%����ֶ�����Hermite��ֵ����ʽ
n=10;h=2/n;x=-1:h:1;
%��ڵ㴦����ֵ��ȡ��λ��Ч����
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;
dy1=df(x);dy1int=floor(dy1);
dy1=dy1int+round(10000*(dy1-dy1int))/10000;
xx=-1:0.05:1; %Ԥ���
yy=cpiece3_hermite_interp(x,y,dy1,xx);
figure('color','white');
title([num2str(n+1),'���Ⱦ�ڵ�ֶ�����Hermite��ֵ']);% 
hold on;
plot(xx,yy,'k--');
fplot(@f,[-1.5,1.5]);
hold off;

%��������������ֵ����ʽ
n=20;h=2/n;x=-1:h:1;
%��ڵ㴦����ֵ��ȡ��λ��Ч����
y=f(x);yint=floor(y);
y=yint+round(10000*(y-yint))/10000;
condnum=1;condval=[50/(1+25)^2,-50/(1+25)^2];
xx=-1:0.05:1; %Ԥ���
yy=cspline3_interp1(x,y,condnum,condval,xx);
figure('color','white');
title([num2str(n+1),'���Ⱦ�ڵ�����������ֵ']);
hold on;
fplot(@f,[-1.5,1.5]);
plot(xx,yy,'r');
hold off;

function y=f(x)
y=1./(1+25*x.^2);

function y=df(x)
y=-50*x./(1+25*x.^2).^2;
