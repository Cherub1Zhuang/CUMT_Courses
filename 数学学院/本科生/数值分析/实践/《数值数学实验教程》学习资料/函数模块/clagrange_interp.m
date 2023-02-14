function yy=clagrange_interp(x,y,xx)
%一元Lagrange插值法函数模块
%　输入：向量x、y为插值条件数据，分别表示插值节点与对应函数值；
%　输入：xx为插值点向量。
%  输出：yy为对应的Lagrange插值作为近似函数值
yy=zeros(size(xx));
n=length(x);
for k=1:n
	%用累积法求第k个基函数的值
    tt=ones(size(xx));
    for j=1:n
        if j~=k
            tt=tt.*(xx-x(j))./(x(k)-x(j));
        end
    end
%　用累和法求对应的插值
    yy=yy+y(k)*tt;
end
