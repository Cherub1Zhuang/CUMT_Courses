function [x,kx]=csor_interation_rule(A,b,x0,w,N,epsilon)
% SOR迭代法函数模块
%　输入：系数矩阵A,右端项b;
%  输入：迭代初值列向量x0;w---松驰参数
%  输入：最大迭代次数N，事后误差限epsilon;
%  输出：x---解向量,迭代过程的中间值kx,其中第k列为第k次迭代结果，
%  第1个元素为迭代次数。

[m,n]=size(A);
if m~=n
    error('系数矩阵不是方阵!');
end

for i=1:n
    if abs(A(i,i))<epsilon
	    str=['第',num2str(i),'步对角元素太小！'];
        error(str);	
    end
end

L=-tril(A,-1);U=-triu(A,1);D=diag(diag(A));

k=0;e=1;kx=[0;x0];
while k<=N & e>epsilon
  x=zeros(n,1);
  delta=zeros(n,1); 
  for i=1:n
       %用(5.45)计算修正量
       delta(i)=(L(i,1:i-1)*x(1:i-1)-A(i,i)*x0(i)...
                +U(i,i+1:n)*x0(i+1:n)+b(i))/A(i,i);
       %用(5.48)计算松驰迭代步
       x(i)=x0(i)+w*delta(i);
  end
  k=k+1;
  kx=[kx,[k;x]];
  e=norm(x0-x);
  x0=x;
end
if k>N & e>epsilon
   warning('SOR迭代法已经超过最大迭代次数，仍未达到精度要求。');    
end 
