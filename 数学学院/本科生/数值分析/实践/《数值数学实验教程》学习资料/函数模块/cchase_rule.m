function [x,q,p]=cchase_rule(a,b,c,d)
%追赶法求解n元三对角线性方程组
%输入：a---下次对角线性元素，其第一个元素补0，使成为n元向量；
%输入：b---主对角线性元素；
%输入：c---上次对角线性元素，其第n个元素补0，使成为n元向量；
%输入：d---右端项向量；
%输出：x---解向量；p,q---中间向量
n=length(b);
p=ones(n,1);q=ones(n,1);

if length(a)~=n||length(d)~=n
    error('The inputed datas have errors!');
else
    p(1)=d(1)/b(1);q(1)=c(1)/b(1);
    for k=2:n
        t=b(k)-a(k)*q(k-1);
        p(k)=(d(k)-a(k)*p(k-1))/t;
        q(k)=c(k)/t;
    end
end

x=ones(n,1);
x(n)=p(n);
for k=n-1:-1:1
    x(k)=p(k)-q(k)*x(k+1);
end
