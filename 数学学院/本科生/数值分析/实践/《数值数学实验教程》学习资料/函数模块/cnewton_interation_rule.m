%ţ�ٵ���������ģ�飺cnewton_interation_rule.m 
function [x,kx]=cnewton_interation_rule(f,df,x0,epsilon,N)
%����newton��������f(x)=0�ĸ���
%�����룺�������@f�����������@df��
%������epsilon������������N��
% ��������Ƹ����������������ݾ���kx
f=fcnchk(f);
df=fcnchk(df);

%���е�����һ������ͣ����׼��ֹͣ����
e=1;k=0;kx=[0,x0];
if abs(feval(f,x0))<=epsilon
    x=x0;
    error('x0���Ǹ���');
end
while e>epsilon & k<=N & abs(feval(f,x0))>epsilon
    k=k+1;
    x=x0-feval(f,x0)/feval(df,x0); %����һ��newton����
    kx=[kx;k,x];
    e=abs(x-x0);
    x0=x;
end
if k>N & e>epsilon
    warning('Newton�������ﵽ������������û�дﵽ����Ҫ��');
end
