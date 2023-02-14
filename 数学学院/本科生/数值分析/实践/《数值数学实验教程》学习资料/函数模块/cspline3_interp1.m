function [yy,m]=cspline3_interp1(x,y,condnum,condval,xx)
%求三次样条插值的三转角法函数模块
%输入：插值节点x，边界条件号及其值condnum,condval，插值点xx
%输出：节点处一阶导数值m，插值点处近似值yy

%求节点最大编号
n=length(x)-1;

%初始化要用到的数组
h=zeros(1,n);lamda=zeros(1,n);mu=zeros(1,n);g=zeros(1,n);
%按（6.36）求步长数组中的元素
h=x(2:n+1)-x(1:n);
%按（6.38）求三转角方程组中元素，
%并保存在lamda(2:n)、mu(2:n)、g(2:n)
for i=1:n-1
    lamda(i+1)=h(i+1)/(h(i)+h(i+1));
    mu(i+1)=1-lamda(i+1);
    dy1=(y(i+1)-y(i))/h(i);
    dy2=(y(i+2)-y(i+1))/h(i+1);
    g(i+1)=3*(lamda(i+1)*dy1+mu(i+1)*dy2);
end

%处理不同边界条件号
switch condnum
    case 1
        %第一种边界条件下
        a=lamda(2:n);b=2*ones(1,n-1);c=mu(2:n);
        g(2)=g(2)-lamda(2)*condval(1);
        g(n)=g(n)-mu(n)*condval(2);
        d=g(2:n);
		%调用三对角方程组的追赶法程序求待定的一阶导数
        m=cchase_rule(a,b,c,d);
        m=[condval(1);m;condval(2)];
        yy=cpiece3_hermite_interp(x,y,m,xx);
    case 2
        %第二种边界条件下
        a=[0,lamda(2:n),1];b=2*ones(1,n+1);c=[1,mu(2:n),0];
        g0=3*(y(2)-y(1))/h(1)-h(1)/2*condval(1);
        gn=3*(y(n+1)-y(n))/h(n)+h(n)/2*condval(2);
        g=[g0,g(2:n),gn];
		%调用三对角方程组的追赶法程序求待定的一阶导数
        m=cchase_rule(a,b,c,g);
        yy=cpiece3_hermite_interp(x,y,m,xx);        
    case 3
        %第三种边界条件下
        lamdan=h(1)/(h(1)+h(n));mun=1-lamdan;
        a=[lamda(3:n),lamdan];b=2*ones(n,1);c=mu(2:n);
        A=diag(b)+diag(a,-1)+diag(c,1);
        A(1,n)=lamda(2);A(n,1)=mun;
        dy1=(y(2)-y(1))/h(1);dy2=(y(n+1)-y(n))/h(n);
        gn=3*(mun*dy1+lamdan*dy2);
        b=[g(2:n),gn];
		%调用列主元素法求周期三对角方程组即求待定的一阶导数
        m=cgauss_partial_pivoting_elimination(A,b,10^-8);
        m=[m(n);m];
        yy=cpiece3_hermite_interp(x,y,m,xx);
    otherwise
        error('边界条件号输入错误！');        
end
