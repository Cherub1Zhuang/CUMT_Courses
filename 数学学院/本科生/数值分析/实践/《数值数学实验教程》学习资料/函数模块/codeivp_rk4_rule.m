function RK=codeivp_rk4_rule(funfcn,interval,h,y0)
%��׼Runge-Kutta������ģ��
%��Runge-Kutta��ʽ���ֵ�������ֵ�⣬֧��������ʽ(9.21)
%���룺��ֵ�����Ҷ˺���f(x,y)���������interval������h����ֵy0
%�������ֵ�����RK�����е�һ��Ϊ�ڵ����У�
%�ڶ��п�ʼΪÿ���⺯���Ľ��ƺ���ֵ���С�
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%����ȷָ���
x=a:h:b;
m=length(y0);  %��(9.21)��������ά��
y=zeros(n+1,m);
y(1,:)=y0;

%�ã�9.21�����м���
for i=1:n
    k1=feval(f,x(i),y(i,:));
    k2=feval(f,x(i)+h/2,y(i,:)+h*k1/2);
    k3=feval(f,x(i)+h/2,y(i,:)+h*k2/2);
    k4=feval(f,x(i+1),y(i,:)+h*k3);
    y(i+1,:)=y(i,:)+h*(k1+2*k2+2*k3+k4)/6;
end
RK=[x',y];
