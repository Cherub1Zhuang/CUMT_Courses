function zzz
%构造一个(n,k)线性分组码gzxxmlz1.m
%生成矩阵
G=[1 0 0 0 1 1;
   0 1 0 0 1 0;
   0 0 1 0 0 0;
   0 0 0 1 0 1];
[k,n]=size(G);
 
%生成所有k长的二进消息：字符串与数组形式。
x=0:2^k-1;mx=dec2bin(x);msg=de2bi(x);
%生成二进线性码,为向量形式
Cb=encode(msg,n,k,'linear/binary',G);
%将码字由向量形式转换成转成串
Cd=bi2de(Cb);Cs=dec2bin(Cd);Cs=Cs(:,end:-1:1);

%生成所有k长的十进消息编码
msg=0:2^k-1;
Cd=encode(msg,n,k,'linear/decimal',G);

%显示每个消息序列与对应的码字序列
kg=[];
for i=1:2^k
    kg=[kg;blanks(5)];
end
disp([int2str(x'),kg,mx,kg,Cs,kg,num2str(Cd')]);
%求最小汉明距离
wt = gfweight(G,'gen')
