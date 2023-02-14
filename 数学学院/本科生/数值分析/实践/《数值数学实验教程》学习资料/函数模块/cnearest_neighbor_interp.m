function yy=cnearest_neighbor_interp(x,y,xx)
%最邻近插值法函数模块
%输入：插值节点向量x及对应的函数值向量y，插值点向量xx。
%输出：插值结果yy。
yy=zeros(size(xx));
n=length(x);
h=x(2:end)-x(1:end-1);
%左端点
ll=xx<x(1);
y(ll)=y(1);
%右端点
ll=xx>=x(n);
y(ll)=y(n);
%中间结点     
for k=2:n-1
    %判断插值点最近哪个点
    ll=xx>=x(k)-h(k-1)/2 & xx<x(k)+h(k)/2;
    yy(ll)=y(k);
end
