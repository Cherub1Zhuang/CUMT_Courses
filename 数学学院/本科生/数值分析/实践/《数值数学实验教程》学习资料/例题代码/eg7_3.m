function zzz
%����7.3������eg7_3.m
%��������
load hahn;
whos
%�������������
[fit22,gof2,out2]= fit(temp,thermex,'rat55')
%����ɢ��ͼ���������
figure('color','white');
title('��rat55ģ�����');
hold on;
plot(temp,thermex,'*');
temp=min(temp):0.1:max(temp);
fpop2=feval(fit22,temp);
plot(temp,fpop2,'k-');
hold off;
