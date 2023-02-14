function [t,T]=cautostep_trapezoidal_rule(f,interval,epsilon,N)
%自动变步长复化梯形求积法函数模块
%输入：被积函数句柄@f，积分区间interval，精度epsilon，最大分半次数N
%输出：积分值t，中间结果T：第k行表示第k次分半后的梯形值T2k。
f = fcnchk(f);
a=interval(1);b=interval(2);

%初始梯形值
h=b-a;
t0=h*(feval(f,a)+feval(f,b))/2;
T=[1,t0];
k=1;e=1;
while k<=N & e>epsilon
    %求分半新增的节点处函数值及其和s12
    x12=a+h/2:h:b-h/2;
    y12=feval(f,x12);
    s12=sum(y12);
    %利用公式(8.26)计算分半后梯形值
    t1=(t0+h*s12)/2;
    k=k+1;
    T=[T;k,t1];
    e=abs(t1-t0);
    t0=t1;
    h=h/2;
end
t=t1;
if k>N
    warning('已经达到二分次数积分值仍未达到精度要求！');
end
