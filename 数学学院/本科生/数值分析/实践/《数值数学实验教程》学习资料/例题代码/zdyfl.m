function zdyfl
%����2.4������zdyfl.m
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
title('�Զ��帡����ϵ') ;
hold off ;

