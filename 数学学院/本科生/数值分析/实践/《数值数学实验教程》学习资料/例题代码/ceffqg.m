%ÀýÌâ4.1Ö÷³ÌÐò: ceffqg.m  
function ceffqg
figure('color','white');
hold on;
x=-2:0.01:2;
y=f(x);yy=zeros(size(x));
plot(x,y,'k-');
plot(x,yy,'k-');
hold off;
epsilon=10^-6;N=1000;
interval=[0.5,1.5];%[-1,0];
[x,abx]=cbisection_rule(@f,interval,epsilon,N);
format long;
x,abx
format short;

function y=f(x)
y=x.^4+2*x.^2-x-3;
