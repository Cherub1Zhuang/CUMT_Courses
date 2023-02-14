function [L,U,P]=cplugauss_decomp(A)
%利用Gauss列主元素法程序求方阵的PLU分解函数模块
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
P=eye(n);L=eye(n);U=zeros(n);
P=P(p,:);
%求系数矩阵A最终消元后的矩阵，并求出三角阵L，U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);
U=triu(la);

