function zzz
%ÀýÌâ7.1Ö÷³ÌÐò:eg7_1.m
load csinh.mat
whos
G=[fai1(x'),fai2(x')];
ab=G'*G\G'*y'

figure('color','white');
hold on;
plot(x,y,'*');
xx=x(1):0.01:x(end);
yy=ab(1)*fai1(xx)+ab(2)*fai2(xx);
plot(xx,yy,'-k');
hold off;

function y=fai1(x)
y=exp(x);

function y=fai2(x)
y=exp(-x);
