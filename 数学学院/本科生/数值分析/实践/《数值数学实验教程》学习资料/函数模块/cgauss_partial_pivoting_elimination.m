function [x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon)
%��Gauss����Ԫ�ط�����ģ��
%�����룺A---ϵ������b---�Ҷ�������
%  ���룺epsilon---�����Ԫ�ص�ģС������������Ԫ�ط��ж�
%  �����x---��������
%�������p----�н�������
%  �����Ak(:,:,k)��ά���鱣����Ԫ�����е�k����Ԫ��õ��ľ���

%׼����ԪʱҪ�õ�����
[m,n]=size(A);
A=[A,b];p=1:n;
Ak=zeros(m,n+1,n-1);
%ѡ��Ԫ����Ԫ
for k=1:n-1
	%ѡ��Ԫ�أ���������Ԫ�����ڵ��к�r
    [t,r]=max(abs(A(k:n,k)));
    r=r+k-1;
    
    if r~=k
        %��¼�����Ա������û�����
        l=1:n;l(r)=k;l(k)=r;
        p=p(l);
        %vp=p(k);p(k)=p(r);p(r)=vp;
        %������k�����r��
        A=A(l,:);
        %vk=A(k,:);A(k,:)=A(r,:);A(r,:)=vk;
    end
    %�����Ԫ�ز�̫С���ͽ�����Ԫ����
    if abs(A(k,k))<=epsilon
        str=['��',num2str(k),'����Ԫ��Ԫ��̫С��'];
        error(str);
    else
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n+1)=A(k+1:n,k+1:n+1)-A(k+1:n,k)*A(k,k+1:n+1);
    end
    %�����k����Ԫ��ľ���
    Ak(:,:,k)=A;
end
%���ش�����
A(n,n+1)=A(n,n+1)/A(n,n);
for k=n-1:-1:1
  A(k,n+1)=(A(k,n+1)-A(k,k+1:n)*A(k+1:n,n+1))/A(k,k);
end
%�����������
x=A(1:n,n+1);
