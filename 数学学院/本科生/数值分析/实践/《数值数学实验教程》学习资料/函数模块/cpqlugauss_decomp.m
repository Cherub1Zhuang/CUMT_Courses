function [P,L,U,Q]=cpqlugauss_decomp(A)
%利用Gauss全主元素法程序求PQLU分解程序函数模块
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
P=eye(n);Q=eye(n);
P=P(p,:);Q=Q(:,q);
%求系数矩阵A最终消元后的矩阵，并求出三角阵L，U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);U=triu(la);
