function [x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon)
%　Gauss全主元法求Ax=b
%　输入：A---系数矩阵，b---右端向量，epsilon---测量主元素是否太小
%　输出：x---解向量
%　输出：p----行交换向量,q----列交换向量
%　输出：Ak三维数组，保存消元过程中的每一次消元后得到的增广矩阵，比如
%　Ak(:,:,k)是第k次消元后得到的增广矩阵。

%准备消元时要用的数据
[m,n]=size(A);
A=[A,b];p=1:n;q=1:n;
Ak=zeros(m,n+1,n-1);

%选主元与消元
for k=1:n-1
	%选主元素，并记下主元素所在的行、列号r, s
    Akn=A(k:n,k:n);
    [t,l]=max(abs(Akn));
    [t,s]=max(t);
    r=l(s);
    r=r+k-1;s=s+k-1;
    
    % 将主元素交换到(k,k)
    if r~=k
        %生成置换向量以便生成置换矩阵
        l=1:n;l(k)=r;l(r)=k;
        p=p(l); 
        %交换第k行与第r行
        A=A(l,:);
    end
    if s~=k
        %生成置换向量以便生成置换矩阵
        l=1:n+1;l(k)=s;l(s)=k;
        q=q(l(1:n)); 
        %交换第k列与第s列
        A=A(:,l);
    end
    %如果主元素不太小，就开始消元
    if abs(A(k,k))<=epsilon
        str=['第',num2str(k),'步消元主元素太小！'];
        error(str);
    else
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    %保存第k次消元后得到的矩阵
    Ak(:,:,k)=A;
end

%回代过程
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
% 输出解向量
x=A(1:n,n+1);
x=x(q);
