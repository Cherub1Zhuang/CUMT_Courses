%���ַ�����ģ�飺cbisection_rule.m 
function [x,abx]=cbisection_rule(f,interval,epsilon,N)
%�����룺�������@f����������interval(1:2)������epsilon�������ִ���N
%����������Ƹ�x�����ֹ����е�С���估���е�����abx��
%  ��һ��Ϊ������˵㣬�ڶ���Ϊ�����Ҷ˵㣬������Ϊ���Ƹ��������е�
f=fcnchk(f);
%Ϊ����׼����ʼ����
a=interval(1);b=interval(2);
l=b-a;n=1;
x=[];abx=[];
%��ʼ����
while l>epsilon & n<=N 
    x=(a+b)/2;  %�������е�
    abx=[abx;a,b,x]; %�����м����ݣ�
    fx=feval(f,x);
    if abs(fx)<=eps
        break;
    elseif sign(feval(f,a))*sign(fx)<0  %ѡ����һ����������
        b=x;
    else
        a=x;
    end
    l=b-a;
    n=n+1;
end
if n>N 
    warning('�Ѿ��ﵽ���ִ������ޣ�����ĸ�δ�ﵽ����Ҫ��');
end
