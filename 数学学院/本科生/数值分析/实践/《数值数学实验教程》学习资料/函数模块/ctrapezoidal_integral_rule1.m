function t=ctrapezoidal_integral_rule1(f,interval,n)
%��֪����������ʽʱ�ĵȾ�ڵ㸴�����ι�ʽ
%���룺�����������@f����������interval������ȷ���n
%��������ֽ��t
f=fcnchk(f);
a=interval(1);b=interval(2);
h=(b-a)/n;
x=a:h:b;y=feval(f,x);

%�ù�ʽ(8.13)�������
t=y(1)+y(n);
for i=2:n-1
    t=t+2*y(i);
end
t=t*h/2;
