%exp2.m 
% ��ϰ2.2
p=8-3-1;L=-3;U=4;
[A,DA]=cfloat_number_sys(p,L,U)
% ģ��ͼ2.3������������ϵ����������
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
title('�Զ��帡����ϵ') ;
hold off ;
% ��ʵ����Ӧ�ļ������
u=[pi sqrt(11) -sin(1.5) -131-1/7];
y=quantize(q,u)
