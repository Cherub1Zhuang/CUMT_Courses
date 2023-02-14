function [x,kx]=cjacobi_interation_rule(A,b,x0,N,epsilon)
% Jacobi ��������� Ax=b
%�����룺ϵ������A,�Ҷ���b;
%  ���룺������ֵ����x0;
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

%����ϵ������A�ķ���
L=-tril(A,-1);U=-triu(A,1);D=diag(diag(A));
%��Ϊ����׼����ֵ
k=0;e=1;kx=[0;x0];
while k<=N & e>epsilon
  x=zeros(n,1); 
  for i=1:n    
     x(i)=(L(i,1:i-1)*x0(1:i-1)+U(i,i+1:n)*x0(i+1:n)+b(i))/A(i,i);   
  end
  k=k+1;
  e=norm(x0-x);
  x0=x;
  kx=[kx,[k;x]];
end
if k>N & e>epsilon
    warning('Jacobi�������Ѿ�������������������δ�ﵽ����Ҫ��');   
end 
