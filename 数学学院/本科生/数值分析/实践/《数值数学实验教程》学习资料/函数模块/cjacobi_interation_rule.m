function [x,kx]=cjacobi_interation_rule(A,b,x0,N,epsilon)
% Jacobi 迭代法求解 Ax=b
%　输入：系数矩阵A,右端项b;
%  输入：迭代初值向量x0;
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

%　求系数矩阵A的分裂
L=-tril(A,-1);U=-triu(A,1);D=diag(diag(A));
%　为迭代准备初值
k=0;e=1;kx=[0;x0];
while k<=N & e>epsilon
  x=zeros(n,1); 
  for i=1:n    
     x(i)=(L(i,1:i-1)*x0(1:i-1)+U(i,i+1:n)*x0(i+1:n)+b(i))/A(i,i);   
  end
  k=k+1;
  e=norm(x0-x);
  x0=x;
  kx=[kx,[k;x]];
end
if k>N & e>epsilon
    warning('Jacobi迭代法已经超过最大迭代次数，仍未达到精度要求。');   
end 
