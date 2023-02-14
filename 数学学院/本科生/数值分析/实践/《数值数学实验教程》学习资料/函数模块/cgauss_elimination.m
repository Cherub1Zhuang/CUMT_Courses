function [x,Ak]=cgauss_elimination(A,b,epsilon)
%　Gauss顺序消去法解线性方程组Ax=b
%　输入：A---系数矩阵，b---右端向量；
%  输入：epsilon---如果主元素的模小于它，则Gauss消去法中断
%  输出：x---解向量，
%　输出：Ak(:,:,k)三维数组,它的第k页保存消元过程中的
%  第k次消元后得到的增广矩阵
[m,n]=size(A);
A=[A,b];
Ak=zeros(m,n+1,n-1);

for k=1:n-1
    if abs(A(k,k))<=epsilon
        str=['第',num2str(k),'步消元主元素太小！'];
        error(str);
    else
        %求消元因子
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        %进行消元步
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    Ak(:,:,k)=A;
end
%回代过程
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
x=A(:,n+1);
