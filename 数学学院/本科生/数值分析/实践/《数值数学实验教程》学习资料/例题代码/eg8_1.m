function eg8_1
%ÀýÌâ8_1Ö÷³ÌÐò£ºeg8_1.m
interval=[-2,2];epsilon=10^-8;N=100;
[t,T]=cautostep_trapezoidal_rule(@f,interval,epsilon,N);
t
T(1:8,:)'
T(9:end,:)'

function y=f(x)
y=2*cos(4*x).*exp(-x.^2);