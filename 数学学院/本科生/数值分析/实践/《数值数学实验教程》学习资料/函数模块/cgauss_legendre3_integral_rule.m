function [g,G]=cgauss_legendre3_integral_rule(f,interval,epsilon,N)
%�Զ��䲽����������Gauss-Legendre�����ʽ����ģ��
%���룺�����������@f����������interval������epsilon�����ְ����N
%��������ֽ��g��ÿ�ηְ�ʱ���ֽ��G�����е�һ��Ϊ�ְ������
%�ڶ���Ϊ���ֽ��.
f = fcnchk(f);
a=interval(1);b=interval(2);
h=b-a;

G=[];k=0;e=1;
g0=0;G=[0,g0];
while k<N & e>63*epsilon
    c=a+h/2:h:b-h/2;
    n=length(c);
    g=0;
    %���ù�ʽ(8.40)���k�ηְ�ʱ�Ļ���
    for i=1:n
        x1=c(i)-h*sqrt(15)/10;x3=c(i)+h*sqrt(15)/10;
        g=g+h*(5*feval(f,x1)+8*feval(f,c(i))+5*feval(f,x3))/18;
    end
    
    k=k+1;
    G=[G;k,g];
    e=abs(g-g0);
    g0=g;
    h=h/2;
end
if k>N
    warning('�Ѿ��ﵽ���ִ�������ֵ��δ�ﵽ����Ҫ��');
end
