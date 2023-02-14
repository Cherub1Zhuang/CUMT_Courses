function [P,L,U,Q]=cpqlugauss_decomp(A)
%����Gaussȫ��Ԫ�ط�������PQLU�ֽ������ģ��
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
P=eye(n);Q=eye(n);
P=P(p,:);Q=Q(:,q);
%��ϵ������A������Ԫ��ľ��󣬲����������L��U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);U=triu(la);
