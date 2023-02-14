%ÀýÌâ4.5Ö÷³ÌÐò£ºslsdlz2.m 
function slsdlz2
epsilon=10^-8;N=1000;
x0=1000;%100
[x,kx]=cnewton_interation_rule(@f,@df,x0,epsilon,N)
figure('color','white');
hold on;
fplot(@f,[-1,3],'k-');
fplot(@xf,[-1,3],'k-');
hold off;


function y=f(x)
y=(x-1)+(x-1).^3;

function y=df(x)
y=1+3*(x-1).^2;

function y=xf(x)  %»­xÖá
y=zeros(size(x));



