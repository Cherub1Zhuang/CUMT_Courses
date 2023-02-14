%秦九韶算法函数模块：cqjsp.m
function y=cqjsp(a,x)
%输入a为降幂多项式的降幂系数行向量，
%x为自变量行向量。
y=zeros(size(x));
n=length(a);
y=a(1);
for i=2:n
    y=a(i)+y.*x;
end
