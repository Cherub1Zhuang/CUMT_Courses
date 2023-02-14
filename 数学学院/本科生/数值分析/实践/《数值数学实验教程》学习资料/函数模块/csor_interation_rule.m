function [x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon)
% SOR����������ģ��
%�����룺ϵ������A,�Ҷ���b;
%  ���룺������ֵ������x0;�sw---�ɳ۲���
%  ���룺����������N���º������epsilon;
%  �����x---������,�������̵��м�ֵkx,���е�k��Ϊ��k�ε��������
%  ��1��Ԫ��Ϊ����������

[m,n]=size(A);
if m~=n
    error('ϵ�������Ƿ���!');
end

for i=1:n
    if abs(A(i,i))<epsilon
	    str=['��',num2str(i),'���Խ�Ԫ��̫С��'];
        error(str);	
    end
end

L=-tril(A,-1);U=-triu(A,1);D=diag(diag(A));

k=0;e=1;kx=[0;x0];
while k<=N & e>epsilon
  x=zeros(n,1);
  delta=zeros(n,1); 
  for i=1:n
       %��(5.45)����������
       delta(i)=(L(i,1:i-1)*x(1:i-1)-A(i,i)*x0(i)...
                +U(i,i+1:n)*x0(i+1:n)+b(i))/A(i,i);
       %��(5.48)�����ɳ۵�����
       x(i)=x0(i)+w*delta(i);
  end
  k=k+1;
  kx=[kx,[k;x]];
  e=norm(x0-x);
  x0=x;
end
if k>N & e>epsilon
   warning('SOR�������Ѿ�������������������δ�ﵽ����Ҫ��');    
end 
