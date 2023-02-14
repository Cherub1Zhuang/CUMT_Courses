%例题4.4主程序:cgxf.m
function cgxf
x0=0.5;x1=2;
epsilon=10^-6;N=1000;
[x,kx]=cscant_interation_rule(@f,x0,x1,epsilon,N);
format long g;
x,kx
format short;
figure('color','white');
hold on;
fplot(@f,[-0.5,2.1],'k-'); %绘制函数
xx=kx(1:5,2);yy=f(xx);
plot(xx,yy,'k--');
fplot(@lf,[-0.5,2.1],'k-'); %绘制x轴
hold off;

function y=f(x)
y=x.^4+2*x.^2-x-3;

function y=lf(x)  %x轴
y=zeros(size(x));

