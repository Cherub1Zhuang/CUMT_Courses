function cntddf1
figure('color','white');
hold on;
fplot(@f,[-10,3],'-*');
fplot(@df,[-10,3],'-');
fplot(@lf,[-10,3],'k--');
hold off;
function y=lf(x) %x轴所在直线
y=zeros(size(x));
function y=f(x)
y=0.1*exp(x)-sin(x).^2+0.5;
function y=df(x)
y=0.1*exp(x)-sin(2*x);