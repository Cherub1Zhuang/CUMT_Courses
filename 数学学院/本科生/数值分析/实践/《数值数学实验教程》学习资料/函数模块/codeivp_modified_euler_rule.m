function  ME=codeivp_modified_euler_rule(funfcn,interval,h,y0)
%�Ľ�Euler������ģ��
%�øĽ�Euler��ʽ���ֵ�������ֵ�⣬֧��������ʽ(9.16)
%���룺��ֵ�����Ҷ˺���f(x,y)���������interval������h����ֵy0
%�������ֵ�����ME�����е�һ��Ϊ�ڵ����У��ڶ��п�ʼΪÿ���⺯��
%�Ľ��ƺ���ֵ���С�
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%����ȷָ���
x=a:h:b;
m=length(y0);  %������ά��
y=zeros(n+1,m);
y(1,:)=y0;

%��(9.16)���м���
for i=1:n
    yp=y(i,:)+h*feval(f,x(i),y(i,:));
    yc=y(i,:)+h*feval(f,x(i+1),yp);
    y(i+1,:)=(yp+yc)/2;
end
ME=[x',y];
