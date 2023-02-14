function [x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon)
%��Gaussȫ��Ԫ����Ax=b
%�����룺A---ϵ������b---�Ҷ�������epsilon---������Ԫ���Ƿ�̫С
%�������x---������
%�������p----�н�������,q----�н�������
%�������Ak��ά���飬������Ԫ�����е�ÿһ����Ԫ��õ���������󣬱���
%��Ak(:,:,k)�ǵ�k����Ԫ��õ����������

%׼����ԪʱҪ�õ�����
[m,n]=size(A);
A=[A,b];p=1:n;q=1:n;
Ak=zeros(m,n+1,n-1);

%ѡ��Ԫ����Ԫ
for k=1:n-1
	%ѡ��Ԫ�أ���������Ԫ�����ڵ��С��к�r, s
    Akn=A(k:n,k:n);
    [t,l]=max(abs(Akn));
    [t,s]=max(t);
    r=l(s);
    r=r+k-1;s=s+k-1;
    
    % ����Ԫ�ؽ�����(k,k)
    if r~=k
        %�����û������Ա������û�����
        l=1:n;l(k)=r;l(r)=k;
        p=p(l); 
        %������k�����r��
        A=A(l,:);
    end
    if s~=k
        %�����û������Ա������û�����
        l=1:n+1;l(k)=s;l(s)=k;
        q=q(l(1:n)); 
        %������k�����s��
        A=A(:,l);
    end
    %�����Ԫ�ز�̫С���Ϳ�ʼ��Ԫ
    if abs(A(k,k))<=epsilon
        str=['��',num2str(k),'����Ԫ��Ԫ��̫С��'];
        error(str);
    else
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    %�����k����Ԫ��õ��ľ���
    Ak(:,:,k)=A;
end

%�ش�����
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
% ���������
x=A(1:n,n+1);
x=x(q);
