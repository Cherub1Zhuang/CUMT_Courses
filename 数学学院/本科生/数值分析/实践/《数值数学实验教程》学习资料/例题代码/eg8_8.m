function eg8_8
%ÀýÌâ8.8Ö÷³ÌÐò£ºeg8_8.m
a=pi;b=2*pi;c=0;d=pi;tol=10^-7;
Q = dblquad(@f, a,b,c,d)
Q = dblquad(@f, a,b,c,d,tol)

function z = f(x,y) 
z = y*sin(x)+x*cos(y);
