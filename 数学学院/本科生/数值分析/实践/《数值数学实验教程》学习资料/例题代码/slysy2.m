%����4.7������slysy2.m 
function slysy2
epsilon=10^-8;N=10000;
x0=0.65; %ȡ�����ֵ��������������
n=length(x0);
for i=1:n
    [x,kx]=cnewton_interation_rule(@f,@df,x0(i),epsilon,N)
end
figure('color','white')
hold on;
ab=[-3,5];fplot(@f,ab,'k-');fplot(@xf,ab,'k-');
x=ab(1):0.05:ab(2);y=qx(x,x0); plot(x,y,'k--');%������
x=ab(1):0.05:ab(2);y=qx(x,kx(2,2)); plot(x,y,'k--');
hold off;

function y=f(x)
y=atan(3*x);

function y=df(x)
y=3./(1+9*x.^2);

function y=qx(x,x0) %����
k=3./(1+9*x0.^2);
y=feval(@f,x0)+k*(x-x0);

function y=xf(x)  %��x��
y=zeros(size(x));

