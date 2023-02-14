%例题2.5主程序： floatnum4.m
function floatnum4
%精度p=17，指数位长k=4,符号位s=1.
p=17;k=5;
a.mode='float';a.roundmode='nearest';a.format=[p+k+1,k];
q=quantizer(a);
get(q)   %显示浮点数系统信息

%量化加数
x=quantize(q,51234);
disp('51234的计算机数');disp(x);
y=quantize(q,0.1);
disp('0.1的计算机数');disp(y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('采用从左至右逐个数相加的顺序计算');
N=10000;
for i=1:N   
    x=quantize(q,x+y);%每加一个0.1都要量化一次。
end
disp('运算结果的计算机数');disp(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('采用后面的10000个0.1先加,然后再加到51234上');
z=0;
for i=1:N
    z=quantize(q,z+y);
end
x=quantize(q,x+z);
disp('运算结果的计算机数');disp(x);

