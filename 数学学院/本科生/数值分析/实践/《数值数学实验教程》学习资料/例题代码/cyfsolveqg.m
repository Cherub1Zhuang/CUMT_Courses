%����4.9������cyfsolveqg.m
function cyfsolveqg
x0=[-3,-0.5,0.5,2,5,30];%ÿ��Ԫ�ض���һ����ֵ
X=[];%���������
for i=1:length(x0)
    x=fzero(@f,x0(i));
    [xx,fx,tag]=fsolve(@f,x0(i));
    X=[X;x,xx]; %[X;x,xx,fx,tag];
end
[x0',X]

function y=f(x)
y=(x-1).^2.*sin(x+1);  
