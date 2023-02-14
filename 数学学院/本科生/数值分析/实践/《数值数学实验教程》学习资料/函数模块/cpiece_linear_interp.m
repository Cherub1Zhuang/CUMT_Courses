function yy=cpiece_linear_interp (x,y,xx)
%分段线性插值函数模块
%输入：插值节点向量x及对应的函数值向量y，插值点向量xx。
%输出：插值结果yy。
yy=zeros(size(xx));
n=length(x);
for k=1:n-1
    %判断插值点所在的小区间
    ll=xx>=x(k) & xx<x(k+1);
    uk=(xx(ll)-x(k))/(x(k+1)-x(k));
    yy(ll)=y(k)*(1-uk)+y(k+1)*uk;
end
ll=xx==x(n);
yy(ll)=y(n);
