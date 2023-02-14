function eg8_7
%ÀýÌâ8.7Ö÷³ÌÐò£ºeg8_7.m
a=0;b=1;tol=10^-7;
n=10;c=[0.05,15];
nc=length(c);
Q1=zeros(n,nc);
Q2=zeros(n,nc);
for n=1:10
    for i=1:nc
        Q1(n,i) = quad(@fun,a,b,tol,1,n,c(i));
        Q2(n,i) = quadl(@fun,a,b,tol,[],n,c(i));
        [q3,fcnt3] = quad(@fun,a,b,tol,1,n,c(i));
        [q4,fcnt4] = quadl(@fun,a,b,tol,[],n,c(i));
    end
end
Q1=[(1:10)',Q1]
Q2=[(1:10)',Q2]

function y=fun(x,n,c)
y=x.^n./(c+x);
