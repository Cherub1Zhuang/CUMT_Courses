function eg5_5
%����5.5������:eg5_5.m
N=1000000; %���������� 
epsilon=10^-8;
%׼������pascalϵ������
n=10; 
A = pascal(n);
b=A*ones(n,1); 
x0=zeros(n,1);
disp('Jacobi��������');
[x,kx]=cjacobi_interation_rule(A,b,x0,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[x;e];

disp('G_S��������');
w=1;
[x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[AA,[x;e]];

disp('SOR��������');
w=1.1;
[x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon);
x,e=norm(x-ones(n,1))
%AA=[AA,[x;e]]