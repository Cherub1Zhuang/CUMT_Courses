%两点割线法函数模块：cscant_interation_rule.m 
function [x,kx]=cscant_interation_rule(f,x0,x1,epsilon,N)
%　输入：函数句柄@f，两个初值 x0,x1，
%　精度epsilon，最大迭代次数N。
%　输出：根x，中间结果kx，第一列迭代次数，第二列迭代结果。
f=fcnchk(f);

%对割线法进行迭代
e=1;k=1;kx=[0,x0];kx=[kx;1,x1];
if abs(feval(f,x1))<=epsilon
    x=x1;
    error('x1就是根！');
end
while e>epsilon & k<=N & abs(feval(f,x1))>epsilon
    k=k+1;
    x=x1-(x1-x0)*feval(f,x1)/(feval(f,x1)-feval(f,x0));
    kx=[kx;k,x];
    e=abs(x-x1);
    x0=x1;x1=x;
end
if k>N
    warning('已经达到最大迭代次数，输出根没有达到精度要求。');
end