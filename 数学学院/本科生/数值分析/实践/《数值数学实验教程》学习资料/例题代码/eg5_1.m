function eg5_1
%����5.1������:eg5_1.m
epsilon=10^-16;
n=10; 
%׼������Hilbertϵ������
A=hilb(n);b=A*ones(n,1);

disp('��˹˳����ȥ����')
[x,Ak]=cgauss_elimination(A,b,epsilon);
 x(end-8:end)'          %���9����
 norm(x-ones(n,1))  %���

