function [yy,A]=cnewton_interp(x,y,xx)
% Newton插值法函数模块
%输入：向量x、y为插值条件数据，分别表示插值节点与对应函数值；
%输出：xx为插值点向量。
%输出：yy为对应于的Newton插值作为近似函数值
%输出：A为牛顿差商表。
m=length(xx);
n=length(x);
%求差商表
A=cnewton_divided_difference(x,y);
yy=zeros(size(xx));
for k=1:n
    % 利用(6.15)求第k-1个基函数的值w(xx)
	w=ones(size(xx));
    for i=1:k-1
        w=w.*(xx-x(i));
    end
    %利用(6.18)求插值点近似值N(xx)
    yy=yy+A(k,k+1)*w;
end
