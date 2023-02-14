function [L,U,P]=cplugauss_decomp(A)
%����Gauss����Ԫ�ط����������PLU�ֽ⺯��ģ��
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
P=eye(n);L=eye(n);U=zeros(n);
P=P(p,:);
%��ϵ������A������Ԫ��ľ��󣬲����������L��U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);
U=triu(la);

