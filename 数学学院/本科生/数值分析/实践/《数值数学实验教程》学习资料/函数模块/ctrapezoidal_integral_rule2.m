function t=ctrapezoidal_integral_rule2(x,y)
%已知被积函数用离散数据表示时不等距节点复化梯形公式函数模块
%输入：被积函数的离散数据对向量x,y
%输出：积分结果t
n=length(x);m=length(y);
if m~=n
    error('数据个数不匹配！');
end

h=[];%求步长向量
for i=1:n-1
    h=[h,x(i+1)-x(i)];
end
%用公式(8.12)进行求积
t=0;
for i=1:n-1
    t=t+h(i)*(y(i)+y(i+1));
end
t=t/2;
