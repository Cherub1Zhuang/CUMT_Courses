%��������������ģ�飺cbasic_interation_rule.m
function [x,kx]=cbasic_interation_rule(f,fai,x0,epsilon,N)
%��������f(x)=0�ĵ�������x=fai(x)�Ļ�������������
%���룺���������к������@f,�����������@fai����ֵx0.
%����epsilon��������������N��
%��������Ƹ�x ,�����м�ֵ����kx��
%��һ��Ϊ�����������ڶ���Ϊ���Ƹ���
f=fcnchk(f);
fai=fcnchk(fai);

%Ϊ����׼����ֵ
e=1;k=0;kx=[0,x0];
%��ʼ����
if abs(feval(f,x0))<=epsilon
    x=x0;
    error('x0���Ǹ���');
end
while e>epsilon & k<=N & abs(feval(f,x0))>epsilon
    k=k+1;
    x=feval(fai,x0);
    kx=[kx;k,x];
    e=abs(x0-x);
    x0=x;
end
if k>N 
    warning('�Ѿ���������������������ĸ�δ�ﵽ����Ҫ��');
end
