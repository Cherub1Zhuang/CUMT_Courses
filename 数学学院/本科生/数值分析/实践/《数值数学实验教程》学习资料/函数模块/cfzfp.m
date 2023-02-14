%分治法求多项式值函数模块：cfzfp.m 
function y=cfzfp(a,x)
%输入a为升幂多项式的升幂系数行向量，x为自变量行向量。
y=zeros(size(x));
n=length(x);
for i=1:n
    y(i)=fzfpb(a,x(i));
end

function y=fzfpb(a,x)
%分治法求多项式值
%输入a为升幂多项式的升幂系数行向量，x为自变量标量。
%检查多项式项数是否为2的幂，如果不是要进行补0；
na=length(a);
%求项数的二进长度
k=length(dec2bin(na)); 
%检查项数是否为2的幂
if na==2^(k-1) 
    k=k-1;
end
n=2^k;
n0=n-na;
%补0
a=[a,zeros(1,n0)];
%矩阵A用于保存系数(3.49)第一式，
%向量X用于保存中间自变量(3.49)第二式
A=[];X=[];
A(1,:)=a; X(1)=x;
for j=1:k
    for i=1:2^(k-j)
        A(j+1,i)=A(j,2*i-1)+A(j,2*i)*X(j);
    end
    X(j+1)=X(j)^2;
end
y=A(k+1,1);
