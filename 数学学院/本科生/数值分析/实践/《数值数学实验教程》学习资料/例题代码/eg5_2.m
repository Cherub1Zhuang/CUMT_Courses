function eg5_2
%����5.2������:eg5_2.m
epsilon=10^-16;
n=110;   
%׼���������ԽǾ���
v0=6*ones(n,1);
v1=8*ones(n-1,1);
v2=ones(n-1,1);
A=diag(v0,0)+diag(v1,-1)+diag(v2,1);
b=A*ones(n,1);

[x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
x(end-8:end)'  %���9����
norm(x-ones(n,1))  % ���






% function zzz
% %����5.2�������ļ���:eg5_2.m
% epsilon=10^-8;
% n=9;   
% %׼������Hilbertϵ������
% A=hilb(n);b=A*ones(n,1);
% 
% disp('��˹˳����ȥ����')
% [x,Ak]=cgausse_elimination(A,b,epsilon);
% x,pause
% disp('��˹����Ԫ�ط���')
% [x,p,Ak]=cgauss_partial_pivoting_elimination(A,b,epsilon);
% x,pause
% disp('��˹ȫ��Ԫ�ط���')
% [x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
% x,pause
