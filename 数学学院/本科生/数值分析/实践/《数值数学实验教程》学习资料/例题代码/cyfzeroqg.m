%����4.8������cyfzeroqg.m
function cyfzeroqg
x=-1:0.01:3;
y=f(x);
figure('color','white');
hold on;
plot(x,y,'k-');         %����ͼ��
fplot(@xf,[-1,3],'k--');
hold off;
x=fzero(@f,[0,3])  %����ָ�������ڵ����

function y=f(x)
y=(x-1).^2.*sin(x+1);

function y=xf(x)
y=zeros(size(x));
