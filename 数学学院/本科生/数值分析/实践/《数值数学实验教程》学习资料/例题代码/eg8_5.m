function eg8_5
%����8.5������eg8_5.m
format long;
a=0;b=5;tol=10^(-7);
p1=1;p2=2;
%�������﷨����
q1=quad(@fun,a,b,tol,1,p1,p2)  
q2=quad(@fun,a,b,tol,[],p1,p2)
[q3,fcnt]=quad(@fun,a,b,tol,[],p1,p2)

function y=fun(x,m,n)
y=exp(-m*x).*cos(n*x);