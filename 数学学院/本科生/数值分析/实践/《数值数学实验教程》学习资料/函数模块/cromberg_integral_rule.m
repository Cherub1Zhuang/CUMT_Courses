function [r,A]=cromberg_integral_rule(f,interval,epsilon,N)
%Romberg求积法函数模块
%输入：N最大分半次数；interval积分区间；
% epsilon精度；f函数句柄；
%输出：r为Romberg值；矩阵A第二三四五列
%分别为梯形、辛普生、Cotes、Romberg值序列；
% 输出：tag=1时在N内满足精度要求的值，
%否则在N内不能得到精度要求的值。
f=fcnchk(f);

a=interval(1);b=interval(2);
h=b-a;
Told=h*(feval(f,a)+feval(f,b))/2;
Sold=NaN;Cold=NaN;Rold=NaN;
A=[0,Told,Sold,Cold,Rold];

k=0;e=1;
while k<N & e>epsilon
    k=k+1;
    %用公式(8.26),(8.27),(8.28),(8.29)求表1新的一行
    x12=a+h/2:h:b-h/2;y12=feval(f,x12);u=sum(y12);
    Tnew=(Told+h*u)/2;
    Snew=(4*Tnew-Told)/3;
    Cnew=(16*Snew-Sold)/15;
    Rnew=(64*Cnew-Cold)/63;
    %将新的一行追加到表中
    A=[A;k,Tnew,Snew,Cnew,Rnew];
    %求误差并进行下一次分半
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
    warning('已经达到最大分半次数积分值仍未满足精度要求！');
end