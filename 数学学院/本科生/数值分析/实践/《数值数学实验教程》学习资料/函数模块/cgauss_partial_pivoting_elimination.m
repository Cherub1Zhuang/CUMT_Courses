function [x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon)
%　Gauss列主元素法函数模块
%　输入：A---系数矩阵，b---右端向量；
%  输入：epsilon---如果主元素的模小于它，则列主元素法中断
%  输出：x---解向量，
%　输出：p----行交换向量
%  输出：Ak(:,:,k)三维数组保存消元过程中的k次消元后得到的矩阵

%准备消元时要用的数据
[m,n]=size(A);
A=[A,b];p=1:n;
Ak=zeros(m,n+1,n-1);
%选主元与消元
for k=1:n-1
	%选主元素，并记下主元素所在的行号r
    [t,r]=max(abs(A(k:n,k)));
    r=r+k-1;
    
    if r~=k
        %记录交换以便生成置换矩阵
        l=1:n;l(r)=k;l(k)=r;
        p=p(l);
        %vp=p(k);p(k)=p(r);p(r)=vp;
        %交换第k行与第r行
        A=A(l,:);
        %vk=A(k,:);A(k,:)=A(r,:);A(r,:)=vk;
    end
    %如果主元素不太小，就进行消元过程
    if abs(A(k,k))<=epsilon
        str=['第',num2str(k),'步消元主元素太小！'];
        error(str);
    else
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    %保存第k步消元后的矩阵
    Ak(:,:,k)=A;
end
%　回代过程
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
%　输出解向量
x=A(1:n,n+1);
