function eg8_6
%例题8.6主程序:eg8_6.m
a=0;b=1;
tol=10^(-7);
q1=quadl(@f,a,b)
q2=quadl(@f,a,b,tol)
q3=quadl(@f,a,b,tol,1)
q4=quadl(@f,a,b,tol,[])
[q5,fcnt]=quadl(@f,a,b,tol)

figure('color','white');
fplot(@f,[0,1.5],'k-');

title('被积函数');


function y=f(x)
y=cos(8*x).*exp(sqrt(x));
