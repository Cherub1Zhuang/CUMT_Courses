function ccensus
%����7.2������ccensus.m
%װ������
load census
%���ж��ζ���ʽ���
[fit2,gof2,out2]= fit(cdate,pop,'poly9') %���÷ֺţ����ڿ�������������
%����ɢ��ͼ���������
figure('color','white');
title('9�ζ���ʽ���');
hold on;
plot(cdate,pop,'*');
fpop2=feval(fit2,cdate);
plot(cdate,fpop2,'k-');
hold off;
