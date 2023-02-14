function eg8_3
%����8.3������ eg8_3.m
N=100;epsilon=10^-8;
interval=[0,4];

[t,T]=cautostep_trapezoidal_rule(@f,interval,epsilon,N);
disp('�Զ��䲽������������Ľ��');
t,T

[r,A]=cromberg_integral_rule(@f,interval,epsilon,N);
disp('Romberg������Ľ��');
r,A

[g,G]=cgauss_legendre3_integral_rule(@f,interval,epsilon,N);
disp('�Զ��䲽������Gauss-Legendre��ʽ���Ľ��');
G,g

function y=f(x)
xi=0:1/4:4;
y=ones(size(x));
for i=0:16
    y=y.*(x-xi(i+1));
end
y=y.^2;
