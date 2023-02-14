function eg8_2
%ÀýÌâ8_2Ö÷³ÌÐò£ºeg8_2.m
interval=[-2,2];epsilon=10^-8;N=100;
[r,A]=cromberg_integral_rule(@f,interval,epsilon,N)

function y=f(x)
y=2*cos(4*x).*exp(-x.^2);
