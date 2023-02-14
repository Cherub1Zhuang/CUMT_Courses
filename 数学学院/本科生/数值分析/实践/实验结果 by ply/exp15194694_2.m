%exp2.m 
% 练习2.2
p=8-3-1;L=-3;U=4;
[A,DA]=cfloat_number_sys(p,L,U)
% 模仿图2.3把这个计算机数系画到数轴上
a.mode='float';
a.roundmode='round';
a.format=[8,3];
q=quantizer(a);
range(q) 
get(q)
u=linspace(-16,16,100);
y=quantize(q,u);
u=ones(size(u));

figure('color','white');
hold on ;
plot(y,u,'.');
plot(y,u);
title('自定义浮点数系') ;
hold off ;
% 求实数对应的计算机数
u=[pi sqrt(11) -sin(1.5) -131-1/7];
y=quantize(q,u)
