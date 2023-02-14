%������߷�����ģ�飺cscant_interation_rule.m 
function [x,kx]=cscant_interation_rule(f,x0,x1,epsilon,N)
%�����룺�������@f��������ֵ x0,x1��
%������epsilon������������N��
%���������x���м���kx����һ�е����������ڶ��е��������
f=fcnchk(f);

%�Ը��߷����е���
e=1;k=1;kx=[0,x0];kx=[kx;1,x1];
if abs(feval(f,x1))<=epsilon
    x=x1;
    error('x1���Ǹ���');
end
while e>epsilon & k<=N & abs(feval(f,x1))>epsilon
    k=k+1;
    x=x1-(x1-x0)*feval(f,x1)/(feval(f,x1)-feval(f,x0));
    kx=[kx;k,x];
    e=abs(x-x1);
    x0=x1;x1=x;
end
if k>N
    warning('�Ѿ��ﵽ�����������������û�дﵽ����Ҫ��');
end