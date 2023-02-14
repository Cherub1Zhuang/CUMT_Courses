%例题4.3主程序：cntddf1.m
function cntddf1
epsilon=10^-8;N=1000;
x0=1.701;  %0.9;%0.5;%1.01;%0.99;%0.5;
[x,kx]=cnewton_interation_rule(@f,@df,x0,epsilon,N)
figure('color','white');
hold on;
fplot(@f,[0.5,3.1],'k-');
fplot(@lf,[0.5,3.1],'k--');
hold off;

function y=lf(x) %x轴所在直线
y=zeros(size(x));

function y=f(x)
y=(x-1).^3.*(x.^2-5*x+6);

function y=df(x)
y=3*(x-1).^2.*(x.^2-5*x+6)+(x-1).^3.*(2*x-5);



