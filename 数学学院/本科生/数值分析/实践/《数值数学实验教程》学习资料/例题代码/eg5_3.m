function eg5_3
%����5.3������:eg5_3.m
epsilon=10^-16;
n=15;   
%׼������Hilbertϵ������
A=hilb(n);b=A*ones(n,1);

disp('��˹ȫ��Ԫ�ط���');
[x,p,q,Ak]=cgauss_complete_pivoting_elimination(A,b,epsilon);
x(end-7:end)'  %���8����
 norm(x-ones(n,1)) %���
