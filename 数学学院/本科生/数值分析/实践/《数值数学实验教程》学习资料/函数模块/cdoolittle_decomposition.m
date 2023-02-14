function [L,U]=cdoolittle_decomposition(A)
%LU�ֽ⺯��ģ��
%���룺����A
%�������λ��������L����������U
%������ֽ�С����Ԫ�����������Ϣ��
epsilon=10^-8;
[m,n]=size(A);
if m~=n 
    error('���벻�Ƿ���');
end

for i=1:n
    %��U�ĵ�i������Ԫ��
    A(i,i:n)=A(i,i:n)-A(i,1:i-1)*A(1:i-1,i:n);
    %�����Ԫ�ز�С����L�ĵ�i��Ԫ��
    if i<=n-1
        if abs(A(i,i))<=epsilon
            str=['��',num2str(i),'����Ԫ��̫СLU�ֽⲻ�ܽ��е��ף�'];
            error(str);	           
        else
            A(i+1:n,i)=(A(i+1:n,i)-A(i+1:n,1:i-1)*A(1:i-1,i))/A(i,i);
        end
    end
end
U=triu(A);L=tril(A,-1)+eye(n);
