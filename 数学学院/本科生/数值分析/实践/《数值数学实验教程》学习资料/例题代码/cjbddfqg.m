%����4.2������: cjbddfqg.m 
function cjbddfqg
x0=1.5;epsilon=10^-6;N=1000;
[x,kx]=cbasic_interation_rule(@f,@fai1,x0,epsilon,N);
format long g;
x,kx
format short;
figure('color','white');
hold on;
title('��������1��ʵ�ߣ�');
fplot(@fai1,[-1,1.5],'k-');
fplot(@lf,[-1,1.5],'k--');
axis equal
hold off;

function y=lf(x)
y=x;
function y=f(x)     
y=x.^4+2*x.^2-x-3;

function y=fai1(x)  %��������1
y=sqrt(sqrt(3+x-2*x.^2));

function y=fai2(x)   %��������2
y=sqrt(sqrt(x+4)-1);

function y=fai3(x)   %��������3
y=x.^4+2*x.^2-3;

function y=fai4(x)   %��������4
y=sqrt((x+3-x.^4)/2);

function y=fai5(x)   %��������5
y=sqrt((x.^2+x+3-x.^4)/3);
