function E=codeivp_euler_ruler(funfcn,interval,h,y0)
%Euler������ģ��
%��Euler��ʽ���ֵ�������ֵ�⣬֧��������ʽ(9.12)
%���룺��ֵ�����Ҷ˺���f(x,y)������interval������h����ֵy0
%�������ֵ�����E�����е�һ��Ϊ�ڵ����У�
%�ڶ��п�ʼΪÿ���⺯���ĺ���ֵ���С�
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%����ȷָ���
x=a:h:b;       %�ڵ�
m=length(y0); %δ֪��������
y=zeros(n+1,m);
y(1,:)=y0;

for i=1:n
    y(i+1,:)=y(i,:)+h*feval(f,x(i),y(i,:));
end
E=[x',y];
