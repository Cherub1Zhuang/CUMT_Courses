function [g,G]=cgauss_legendre3_integral_rule(f,interval,epsilon,N)
%自动变步长复化三点Gauss-Legendre求积公式函数模块
%输入：被积函数句柄@f，积分区间interval，精度epsilon，最大分半次数N
%输出：积分结果g，每次分半时积分结果G，其中第一列为分半次数，
%第二列为积分结果.
f = fcnchk(f);
a=interval(1);b=interval(2);
h=b-a;

G=[];k=0;e=1;
g0=0;G=[0,g0];
while k<N & e>63*epsilon
    c=a+h/2:h:b-h/2;
    n=length(c);
    g=0;
    %利用公式(8.40)求第k次分半时的积分
    for i=1:n
        x1=c(i)-h*sqrt(15)/10;x3=c(i)+h*sqrt(15)/10;
        g=g+h*(5*feval(f,x1)+8*feval(f,c(i))+5*feval(f,x3))/18;
    end
    
    k=k+1;
    G=[G;k,g];
    e=abs(g-g0);
    g0=g;
    h=h/2;
end
if k>N
    warning('已经达到二分次数积分值仍未达到精度要求！');
end
