function [Y,F,YBAR,FBAR]=codeivp_AdamsPECE_rule(funfcn,interval,h,y0)
%�Ľ�AdamsPECEԤ��У��ϵͳ����ģ��
%�Ľ�AdamsPECEԤ��У��ϵͳ���ֵ�������ֵ�⣬֧��������ʽ(9.30)
%���룺��ֵ�����Ҷ˺���f(x,y)���������interval������h����ֵy0
%�����Y��ֵ��������е�һ��Ϊ�ڵ����У�
%�ڶ��п�ʼΪÿ���⺯���Ľ��ƺ���ֵ���С�
%�����F����ֵ�����Y��Ӧ���Ҷ˺���f(x,y)ֵ�ľ���
%���е�һ��Ϊ�ڵ����У��ڶ��п�ʼΪ����ֵ���С�
%�����Ԥ����ֵ�����YBAR�����е�һ��Ϊ�ڵ����У�
%�ڶ���ʼΪÿ���⺯���ĺ���ֵ����
%���������ֵ�����YBAR��Ӧ���Ҷ˺���f(x,y)��Ԥ��ֵ����FBAR��
%���е�һ��Ϊ�ڵ����У��ڶ��п�ʼΪ����ֵ���С�

f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%����ȷָ���
x=a:h:b;
m=length(y0);%δ֪��������
y=zeros(n+1,m);fv=zeros(n+1,m);

%���Ľ�RK������AdamsPECEϵͳ�ĳ�ֵy1,y2,y3
y(1,:)=y0;
for i=1:3
    k1=feval(f,x(i),y(i,:));
    fv(i,:)=k1;%�����Ҷ˺���ֵ
    k2=feval(f,x(i)+h/2,y(i,:)+h*k1/2);
    k3=feval(f,x(i)+h/2,y(i,:)+h*k2/2);
    k4=feval(f,x(i+1),y(i,:)+h*k3);
    y(i+1,:)=y(i,:)+h*(k1+2*k2+2*k3+k4)/6;
end
fv(4,:)=feval(f,x(4),y(4,:));%�����Ҷ˺���ֵ

%���Ľ�AdamsPECE��������ƽ�
ybar=zeros(n+1,m);fbarv=zeros(n+1,m);
for i=4:n
    ybar(i+1,:)=y(i,:)+h*(55*fv(i,:)-59*fv(i-1,:)+37*fv(i-2,:)-9*fv(i-3,:))/24;
    fbarv(i+1,:)=feval(f,x(i+1),ybar(i+1,:));
    y(i+1,:)=y(i,:)+h*(9*fbarv(i+1,:)+19*fv(i,:)-5*fv(i-1,:)+fv(i-2,:))/24;
    fv(i+1,:)=feval(f,x(i+1),y(i+1,:));
end
Y=[x',y];F=[x',fv];YBAR=[x',ybar];FBAR=[x',fbarv];
