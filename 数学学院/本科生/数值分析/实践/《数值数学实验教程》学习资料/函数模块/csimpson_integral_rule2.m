function s=csimpson_integral_rule2(x,y)
%已知被积函数在等距节点离散数据时复化Simpson公式函数模块
%输入：被积函数在等距节点x上的函数值y,要求节点总数为奇数
%输出：积分结果s
n=length(x);m=length(y);
if m~=n	
    error('数据不成对！');
end
if rem(n,2)~=1
    error('数据不是奇数对！');
end

%求步长
h=[];
for i=1:n-1
    h=[h,x(i+1)-x(i)];
end
%检查是否为等距节点
l=h==h(1);
if all(l)~=1
    error('不是等距节点！');
end

%用公式(8.19)进行求积
y12=y(2:2:n);y=y(1:2:n);
nn=length(y);
s=y(1)+4*y12(1)+y(nn);
for i=2:nn-1
   s=s+4*y12(i)+2*y(i);
end
s=s*h(1)/3;
