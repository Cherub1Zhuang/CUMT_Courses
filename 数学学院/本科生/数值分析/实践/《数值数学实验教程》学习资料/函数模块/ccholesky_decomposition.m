function [L,D]=ccholesky_decomposition(A,tag)
% 求对称正定矩阵的Cholesky分解函数模块，支持LLT和LDLT。
%　输入正定矩阵A，是否进行LDLT分解的标志tag
%　输出：若tag=0则进行LLT分解，若tag非0则进行LDLT分解。
epsilon=10^-7;
[m,n]=size(A);
L=zeros(n);
%计算第k列元素
for k=1:n
    t=A(k,k)-L(k,1:k-1)*L(k,1:k-1)';
    if t<0
        str=['第',num2str(k),'步遇到负数开方，该矩阵非正定！'];
        error(str);	    
    else
        L(k,k)=sqrt(t);
        L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1)')/L(k,k);
    end
end

%求LDLT分解
if  tag==0
    D=[];
else   
    D=diag(diag(L).^2);
    for i=1:n
        L(i:n,i)=L(i:n,i)/L(i,i);
    end
end

 