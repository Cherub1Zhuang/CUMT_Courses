function [L,U,p]=cpdoolittle_decomposition(A)
%PLU�ֽ⺯��ģ��
%���룺����A
%�������λ��������L����������U,�û�����p
%������ֽ�С����Ԫ�����������Ϣ��
epsilon=10^-8;
[m,n]=size(A);
if m~=n 
    error('���Ƿ���');
end

p=1:n;
for i=1:n
    %����Ԫ��
    A(i:n,i)=A(i:n,i)-A(i:n,1:i-1)*A(1:i-1,i);
    [t,r]=max(abs(A(i:n,i)));
    r=r+i-1;
    if r~=i
        %��¼�����Ա������û�����
        l=1:n;l(r)=i;l(i)=r;
        p=p(l);
        %������i�����r��
        A=A(l,:);
    end
    %��U�ĵ�i������Ԫ��
    A(i,i+1:n)=A(i,i+1:n)-A(i,1:i-1)*A(1:i-1,i+1:n);
    %�����Ԫ�ز�С����L�ĵ�i��Ԫ��
    if abs(A(i,i))<=epsilon
        str=['��',num2str(i),'����Ԫ��̫СLU�ֽⲻ�ܽ��е��ף�'];
        error(str);	           
    elseif i<=n-1
        A(i+1:n,i)=(A(i+1:n,i)-A(i+1:n,1:i-1)*A(1:i-1,i))/A(i,i);
    end
end
L=tril(A,-1)+eye(n);U=triu(A);

