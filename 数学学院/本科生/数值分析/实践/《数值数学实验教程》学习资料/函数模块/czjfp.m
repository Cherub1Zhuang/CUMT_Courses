%多项式求值的直接法函数模块：czjfp.m 
function y=czjfp(a,x)
%  直接法求多项式值
%  输入：a为降幂多项式的降幂系数向量；
%  输入：x为自变量
n=length(a);
y=zeros(size(x));
w=ones(size(x));
%求函数值
for i=1:n    
    y=y+a(n-i+1)*w;
    w=w.*x;
end
