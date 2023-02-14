function [x,Ak]=cgauss_elimination(A,b,epsilon)
%��Gauss˳����ȥ�������Է�����Ax=b
%�����룺A---ϵ������b---�Ҷ�������
%  ���룺epsilon---�����Ԫ�ص�ģС��������Gauss��ȥ���ж�
%  �����x---��������
%�������Ak(:,:,k)��ά����,���ĵ�kҳ������Ԫ�����е�
%  ��k����Ԫ��õ����������
[m,n]=size(A);
A=[A,b];
Ak=zeros(m,n+1,n-1);

for k=1:n-1
    if abs(A(k,k))<=epsilon
        str=['��',num2str(k),'����Ԫ��Ԫ��̫С��'];
        error(str);
    else
        %����Ԫ����
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        %������Ԫ��
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    Ak(:,:,k)=A;
end
%�ش�����
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
x=A(:,n+1);
