function [L,U,p]=cpdoolittle_decomposition(A)
%PLU分解函数模块
%输入：方阵A
%输出：单位下三角阵L，上三角阵U,置换向量p
%如果出现较小的主元素则给出错信息。
epsilon=10^-8;
[m,n]=size(A);
if m~=n 
    error('不是方阵！');
end

p=1:n;
for i=1:n
    %求主元素
    A(i:n,i)=A(i:n,i)-A(i:n,1:i-1)*A(1:i-1,i);
    [t,r]=max(abs(A(i:n,i)));
    r=r+i-1;
    if r~=i
        %记录交换以便生成置换矩阵
        l=1:n;l(r)=i;l(i)=r;
        p=p(l);
        %交换第i行与第r行
        A=A(l,:);
    end
    %求U的第i行所有元素
    A(i,i+1:n)=A(i,i+1:n)-A(i,1:i-1)*A(1:i-1,i+1:n);
    %如果主元素不小就求L的第i列元素
    if abs(A(i,i))<=epsilon
        str=['第',num2str(i),'步主元素太小LU分解不能进行到底！'];
        error(str);	           
    elseif i<=n-1
        A(i+1:n,i)=(A(i+1:n,i)-A(i+1:n,1:i-1)*A(1:i-1,i))/A(i,i);
    end
end
L=tril(A,-1)+eye(n);U=triu(A);

