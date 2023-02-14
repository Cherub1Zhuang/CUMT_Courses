function eg5_2
%例题5.2主程序:eg5_2.m
epsilon=10^-16;
n=110;   
%准备生成三对角矩阵
v0=6*ones(n,1);
v1=8*ones(n-1,1);
v2=ones(n-1,1);
A=diag(v0,0)+diag(v1,-1)+diag(v2,1);
b=A*ones(n,1);

[x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
x(end-8:end)'  %最后9个解
norm(x-ones(n,1))  % 误差






% function zzz
% %例题5.2主程序，文件名:eg5_2.m
% epsilon=10^-8;
% n=9;   
% %准备生成Hilbert系数矩阵
% A=hilb(n);b=A*ones(n,1);
% 
% disp('高斯顺序消去法：')
% [x,Ak]=cgausse_elimination(A,b,epsilon);
% x,pause
% disp('高斯列主元素法：')
% [x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
% x,pause
% disp('高斯全主元素法：')
% [x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
% x,pause
