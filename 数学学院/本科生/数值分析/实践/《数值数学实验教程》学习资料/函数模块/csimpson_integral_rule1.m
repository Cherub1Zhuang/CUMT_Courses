function s=csimpson_integral_rule1(@f,interval,n)
%��֪����������ʽʱ�ĵȾ�ڵ㸴��Simpson��ʽ
%���룺�����������@f����������interval������ȷ���n
%��������ֽ��s
f=fcnchk(f);
a=interval(1);b=interval(2);
h=(b-a)/n;
x=a:h/2:b;y=feval(f,x);

%�����֮һ�ڵ�
xi12=x(2:2:2*n+1);y12=y(2:2:2*n+1);

%��ڵ�
x=x(1:2:2*n+1);y=y(1:2:2*n+1);

%�ù�ʽ(8.19)�������
s=y(1)+4*y12(1)+y(n+1);
for i=2:n
s=s+4*y12(i)+2*y(i);
end
s=s*h/6;
