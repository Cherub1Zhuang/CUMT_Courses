function A=cnewton_divided_difference(x,y)
%计算第一种形式的差商表函数模块
%输入:插值节点向量x，对应函数值向量y;
%输出:差商表矩阵A，其第一列为插值节点，第二列为对应函数值，
%第三列为一阶差商，第四列为二阶差商，……。
%没有差商的元素设置为非数即NaN。
[m,n]=size(x);
%如果x,y是行向量，将它转为列向量
if m==1
    x=x';y=y';
    [m,n]=size(x);
end
%生成一个矩阵A用于保存差商
A=zeros(m);
for i=1:m
    %逐行计算差商
    A(i,1)=y(i);
    for j=2:i
        A(i,j)=(A(i,j-1)-A(j-1,j-1))/(x(i)-x(j-1));
    end
end
%填充差商表中非差商部分
for i=1:m
    A(i,i+1:m)=NaN;
end
A=[x,A];
