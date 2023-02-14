function s=csimpson_integral_rule1(@f,interval,n)
%已知被积函解析式时的等距节点复化Simpson公式
%输入：被积函数句柄@f，积分区间interval，区间等分数n
%输出：积分结果s
f=fcnchk(f);
a=interval(1);b=interval(2);
h=(b-a)/n;
x=a:h/2:b;y=feval(f,x);

%求二分之一节点
xi12=x(2:2:2*n+1);y12=y(2:2:2*n+1);

%求节点
x=x(1:2:2*n+1);y=y(1:2:2*n+1);

%用公式(8.19)进行求积
s=y(1)+4*y12(1)+y(n+1);
for i=2:n
s=s+4*y12(i)+2*y(i);
end
s=s*h/6;
