function [t,T]=cautostep_trapezoidal_rule(f,interval,epsilon,N)
%�Զ��䲽�������������������ģ��
%���룺�����������@f����������interval������epsilon�����ְ����N
%���������ֵt���м���T����k�б�ʾ��k�ηְ�������ֵT2k��
f = fcnchk(f);
a=interval(1);b=interval(2);

%��ʼ����ֵ
h=b-a;
t0=h*(feval(f,a)+feval(f,b))/2;
T=[1,t0];
k=1;e=1;
while k<=N & e>epsilon
    %��ְ������Ľڵ㴦����ֵ�����s12
    x12=a+h/2:h:b-h/2;
    y12=feval(f,x12);
    s12=sum(y12);
    %���ù�ʽ(8.26)����ְ������ֵ
    t1=(t0+h*s12)/2;
    k=k+1;
    T=[T;k,t1];
    e=abs(t1-t0);
    t0=t1;
    h=h/2;
end
t=t1;
if k>N
    warning('�Ѿ��ﵽ���ִ�������ֵ��δ�ﵽ����Ҫ��');
end
