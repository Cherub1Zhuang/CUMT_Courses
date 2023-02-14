function eg5_1
%例题5.1主程序:eg5_1.m
epsilon=10^-16;
n=10; 
%准备生成Hilbert系数矩阵
A=hilb(n);b=A*ones(n,1);

disp('高斯顺序消去法：')
[x,Ak]=cgauss_elimination(A,b,epsilon);
 x(end-8:end)'          %最后9个解
 norm(x-ones(n,1))  %误差

