function E=codeivp_euler_ruler(funfcn,interval,h,y0)
%Euler法函数模块
%用Euler公式求初值问题的数值解，支持向量形式(9.12)
%输入：初值问题右端函数f(x,y)，区间interval，步长h，初值y0
%输出：数值解矩阵E，其中第一列为节点序列，
%第二列开始为每个解函数的函数值序列。
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%区间等分个数
x=a:h:b;       %节点
m=length(y0); %未知函数个数
y=zeros(n+1,m);
y(1,:)=y0;

for i=1:n
    y(i+1,:)=y(i,:)+h*feval(f,x(i),y(i,:));
end
E=[x',y];
