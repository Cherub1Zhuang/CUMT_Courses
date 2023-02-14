function eg5_5
%例题5.5主程序:eg5_5.m
N=1000000; %最大迭代次数 
epsilon=10^-8;
%准备生成pascal系数矩阵
n=10; 
A = pascal(n);
b=A*ones(n,1); 
x0=zeros(n,1);
disp('Jacobi迭代法：');
[x,kx]=cjacobi_interation_rule(A,b,x0,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[x;e];

disp('G_S迭代法：');
w=1;
[x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[AA,[x;e]];

disp('SOR迭代法：');
w=1.1;
[x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[AA,[x;e]]