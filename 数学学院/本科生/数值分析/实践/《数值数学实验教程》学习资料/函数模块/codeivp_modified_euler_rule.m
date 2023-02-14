function  ME=codeivp_modified_euler_rule(funfcn,interval,h,y0)
%改进Euler法函数模块
%用改进Euler公式求初值问题的数值解，支持向量形式(9.16)
%输入：初值问题右端函数f(x,y)句柄，区间interval，步长h，初值y0
%输出：数值解矩阵ME，其中第一列为节点序列，第二列开始为每个解函数
%的近似函数值序列。
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%区间等分个数
x=a:h:b;
m=length(y0);  %求向量维数
y=zeros(n+1,m);
y(1,:)=y0;

%用(9.16)进行计算
for i=1:n
    yp=y(i,:)+h*feval(f,x(i),y(i,:));
    yc=y(i,:)+h*feval(f,x(i+1),yp);
    y(i+1,:)=(yp+yc)/2;
end
ME=[x',y];
