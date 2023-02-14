function zdyfl
%例题2.4主程序：zdyfl.m
a.mode='float';
a.roundmode='round';
a.format=[5,2];
q=quantizer(a);
range(q) 
get(q)
u=linspace(-5,5,100);
y=quantize(q,u);
u=ones(size(u));

figure('color','white');
hold on ;
plot(y,u,'.');
plot(y,u);
title('自定义浮点数系') ;
hold off ;

