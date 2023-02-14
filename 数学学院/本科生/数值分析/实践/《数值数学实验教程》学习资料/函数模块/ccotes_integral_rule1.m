function c=ccotes_integral_rule1(@f,interval,n)
%��֪����������ʽʱ�Ⱦ�ڵ㸴��Cotes��ʽ����ģ��
%���룺�����������@f����������interval������ȷ���n
%��������ֽ��c

f=fcnchk(f);
a=interval(1);b=interval(2);
h=(b-a)/n;
x=a:h/4:b;y=feval(f,x);

x14=x(2:4:end);x12=x(3:4:end);x34=x(4:4:end);x=x(1:4:end);
y14=y(2:4:end);y12=y(3:4:end);y34=y(4:4:end);y=y(1:4:end);

c=7*(y(1)+y(n+1))+32*(y14(1)+y34(1))+12*y12(1);
for i=2:n
c=c+14*y(i)+32*(y14(i)+y34(i))+12*y12(i);
end
c=c*h/90;
