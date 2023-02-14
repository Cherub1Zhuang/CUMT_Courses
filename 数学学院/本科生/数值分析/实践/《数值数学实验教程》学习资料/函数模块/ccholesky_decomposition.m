function [L,D]=ccholesky_decomposition(A,tag)
% ��Գ����������Cholesky�ֽ⺯��ģ�飬֧��LLT��LDLT��
%��������������A���Ƿ����LDLT�ֽ�ı�־tag
%���������tag=0�����LLT�ֽ⣬��tag��0�����LDLT�ֽ⡣
epsilon=10^-7;
[m,n]=size(A);
L=zeros(n);
%�����k��Ԫ��
for k=1:n
    t=A(k,k)-L(k,1:k-1)*L(k,1:k-1)';
    if t<0
        str=['��',num2str(k),'�����������������þ����������'];
        error(str);	    
    else
        L(k,k)=sqrt(t);
        L(k+1:n,k)=(A(k+1:n,k)-L(k+1:n,1:k-1)*L(k,1:k-1)')/L(k,k);
    end
end

%��LDLT�ֽ�
if  tag==0
    D=[];
else   
    D=diag(diag(L).^2);
    for i=1:n
        L(i:n,i)=L(i:n,i)/L(i,i);
    end
end

 