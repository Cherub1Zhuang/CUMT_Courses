function eg5_3
%例题5.3主程序:eg5_3.m
epsilon=10^-16;
n=15;   
%准备生成Hilbert系数矩阵
A=hilb(n);b=A*ones(n,1);

disp('高斯全主元素法：');
[x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
x(end-7:end)'  %最后8个解
 norm(x-ones(n,1)) %误差
