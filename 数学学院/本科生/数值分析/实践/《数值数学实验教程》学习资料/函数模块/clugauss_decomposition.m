function [L,U]=clugauss_decomposition(A)
%利用Gauss顺序消去法程序求方阵的LU分解函数模块
epsilon=10^-7;
[m,n]=size(A);
b=zeros(m,1);
[x,Ak]=cgauss_elimination(A,b,epsilon);
%求系数矩阵A最终消元后的矩阵，并求出三角阵L，U
la=Ak(:,:,n-1);la=la(:,1:n);
L=eye(n)+tril(la,-1);U=triu(la);



