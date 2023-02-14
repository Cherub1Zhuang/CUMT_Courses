function [r,A]=cromberg_integral_rule(f,interval,epsilon,N)
%Romberg���������ģ��
%���룺N���ְ������interval�������䣻
% epsilon���ȣ�f���������
%�����rΪRombergֵ������A�ڶ���������
%�ֱ�Ϊ���Ρ���������Cotes��Rombergֵ���У�
% �����tag=1ʱ��N�����㾫��Ҫ���ֵ��
%������N�ڲ��ܵõ�����Ҫ���ֵ��
f=fcnchk(f);

a=interval(1);b=interval(2);
h=b-a;
Told=h*(feval(f,a)+feval(f,b))/2;
Sold=NaN;Cold=NaN;Rold=NaN;
A=[0,Told,Sold,Cold,Rold];

k=0;e=1;
while k<N & e>epsilon
    k=k+1;
    %�ù�ʽ(8.26),(8.27),(8.28),(8.29)���1�µ�һ��
    x12=a+h/2:h:b-h/2;y12=feval(f,x12);u=sum(y12);
    Tnew=(Told+h*u)/2;
    Snew=(4*Tnew-Told)/3;
    Cnew=(16*Snew-Sold)/15;
    Rnew=(64*Cnew-Cold)/63;
    %���µ�һ��׷�ӵ�����
    A=[A;k,Tnew,Snew,Cnew,Rnew];
    %����������һ�ηְ�
    if k>3
        e=abs(Rnew-Rold);
    else
        e=1;
    end
    Told=Tnew;Sold=Snew;Cold=Cnew;Rold=Rnew;
    h=h/2;
end
if k<=N
    r=Rold;
else
    warning('�Ѿ��ﵽ���ְ��������ֵ��δ���㾫��Ҫ��');
end