function [Y,F,P,C,M]=codeivp_AdamsPMECME_rule(funfcn,interval,h,y0)
%四阶AdamsPMECME预测校正系统函数模块
%四阶AdamsPMECME预测校正系统求初值问题的数值解，支持向量形式(9.33)
%输入：初值问题右端函数f(x,y)句柄，区间interval，步长h，初值y0
%输出：Y数值解矩阵，其中第一列为节点序列，
%第二列开始为每个解函数的近似函数值序列。
%输出：F是与数值解矩阵Y对应的右端函数f(x,y)值的矩阵，
%其中第一列为节点序列，第二列开始为函数值序列。
%输出：P预测数值解矩阵，其中第一列为节点序列，
%第二开始为每个解函数的预测函数值序列
%输出：C校正数值解矩阵，其中第一列为节点序列，
%第二列开始为每个解函数的校正函数值序列
%输出：M修正数值解矩阵，其中第一列为节点序列，
%第二列开始为每个解函数的修正函数值序列

f=fcnchk(funfcn);
a=interval(1);b=interval(2);
n=floor((b-a)/h);  %求区间等分数目
x=a:h:b;
m=length(y0);
y=zeros(n+1,m);fv=zeros(n+1,m);

%用四阶RK方法求AdamsPMECME系统的初值y1,y2,y3
y(1,:)=y0;
for i=1:3
    k1=feval(f,x(i),y(i,:));
    fv(i,:)=k1;%保存右端函数值
    k2=feval(f,x(i)+h/2,y(i,:)+h*k1/2);
    k3=feval(f,x(i)+h/2,y(i,:)+h*k2/2);
    k4=feval(f,x(i+1),y(i,:)+h*k3);
    y(i+1,:)=y(i,:)+h*(k1+2*k2+2*k3+k4)/6;
end
fv(4,:)=feval(f,x(4),y(4,:));%保存右端函数值

%用四阶AdamsPMECME方法求近似解
P=zeros(n+1,m);M=zeros(n+1,m);fbarv=zeros(n+1,m);C=zeros(n+1,m);
for i=4:n
    P(i+1,:)=y(i,:)+h*(55*fv(i,:)-59*fv(i-1,:)+37*fv(i-2,:)-9*fv(i-3,:))/24;
    M(i+1,:)=P(i+1,:)-(P(i,:)-C(i,:))*251/270;   %首次修正值
    fbarv(i+1,:)=feval(f,x(i+1),M(i+1,:));
    C(i+1,:)=y(i,:)+h*(9*fbarv(i+1,:)+19*fv(i,:)-5*fv(i-1,:)+fv(i-2,:))/24;
    y(i+1,:)=C(i+1,:)+(P(i+1,:)-C(i+1,:))*19/270;
    fv(i+1,:)=feval(f,x(i+1),y(i+1,:));
end
%输出节点处数值解、右端函数f(x,y)值、预测值、校正值、首次修正值
Y=[x',y];F=[x',fv];P=[x',P];C=[x',C];M=[x',M];
