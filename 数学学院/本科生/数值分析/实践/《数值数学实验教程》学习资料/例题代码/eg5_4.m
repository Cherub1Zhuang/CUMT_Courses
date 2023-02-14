function eg5_4
%ÀýÌâ5.4Ö÷³ÌÐò:eg5_4.m
n=200;
a=6*ones(n,1);a(1)=0;
b=8*ones(n,1);
c=ones(n,1);c(n)=0;
d=a+b+c;

[x,q,p]=cchase_rule(a,b,c,d);
[x,q,p]
norm(x-1)
