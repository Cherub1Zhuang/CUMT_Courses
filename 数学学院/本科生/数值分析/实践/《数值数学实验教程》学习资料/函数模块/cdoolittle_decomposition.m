function [L,U]=cdoolittle_decomposition(A)
%LU分解函数模块
%输入：方阵A
%输出：单位下三角阵L，上三角阵U
%如果出现较小的主元素则给出错信息。
epsilon=10^-8;
[m,n]=size(A);
if m~=n 
    error('输入不是方阵！');
end

for i=1:n
    %求U的第i行所有元素
    A(i,i:n)=A(i,i:n)-A(i,1:i-1)*A(1:i-1,i:n);
    %如果主元素不小就求L的第i列元素
    if i<=n-1
        if abs(A(i,i))<=epsilon
            str=['第',num2str(i),'步主元素太小LU分解不能进行到底！'];
            error(str);	           
        else
            A(i+1:n,i)=(A(i+1:n,i)-A(i+1:n,1:i-1)*A(1:i-1,i))/A(i,i);
        end
    end
end
U=triu(A);L=tril(A,-1)+eye(n);
