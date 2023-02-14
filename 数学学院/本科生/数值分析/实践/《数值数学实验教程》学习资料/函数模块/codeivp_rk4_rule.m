function RK=codeivp_rk4_rule(funfcn,interval,h,y0)
%标准Runge-Kutta法函数模块
%用Runge-Kutta公式求初值问题的数值解，支持向量形式(9.21)
%输入：初值问题右端函数f(x,y)句柄，区间interval，步长h，初值y0
%输出：数值解矩阵RK，其中第一列为节点序列，
%第二列开始为每个解函数的近似函数值序列。
f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);%区间等分个数
x=a:h:b;
m=length(y0);  %求(9.21)中向量的维数
y=zeros(n+1,m);
y(1,:)=y0;

%用（9.21）进行计算
for i=1:n
    k1=feval(f,x(i),y(i,:));
    k2=feval(f,x(i)+h/2,y(i,:)+h*k1/2);
    k3=feval(f,x(i)+h/2,y(i,:)+h*k2/2);
    k4=feval(f,x(i+1),y(i,:)+h*k3);
    y(i+1,:)=y(i,:)+h*(k1+2*k2+2*k3+k4)/6;
end
RK=[x',y];
