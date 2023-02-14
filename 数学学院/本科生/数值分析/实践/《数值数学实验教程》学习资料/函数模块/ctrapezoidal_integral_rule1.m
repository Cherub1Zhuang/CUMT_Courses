function t=ctrapezoidal_integral_rule1(f,interval,n)
%已知被积函解析式时的等距节点复化梯形公式
%输入：被积函数句柄@f，积分区间interval，区间等分数n
%输出：积分结果t
f=fcnchk(f);
a=interval(1);b=interval(2);
h=(b-a)/n;
x=a:h:b;y=feval(f,x);

%用公式(8.13)进行求积
t=y(1)+y(n);
for i=2:n-1
    t=t+2*y(i);
end
t=t*h/2;
