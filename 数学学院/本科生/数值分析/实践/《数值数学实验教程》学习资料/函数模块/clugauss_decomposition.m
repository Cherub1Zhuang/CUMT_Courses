function [L,U]=clugauss_decomposition(A)
%����Gauss˳����ȥ�����������LU�ֽ⺯��ģ��
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,Ak]=cgauss_elimination(A,b,epsilon);
%��ϵ������A������Ԫ��ľ��󣬲����������L��U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);U=triu(la);



