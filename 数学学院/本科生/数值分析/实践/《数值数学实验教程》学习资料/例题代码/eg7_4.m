function eg7_4
%����7.4������eg7_4.m
%��������
load hahn;
%�Զ���ģ��
mymodel2 = fittype('x./(a*x+b)');
%�������������
[fit22,gof2,out2]= fit(temp,thermex,mymodel2)
%����ɢ��ͼ���������
figure('color','white');
title('���Զ���ģ��1���');
hold on;
plot(temp,thermex,'*');
temp=min(temp):0.1:max(temp);
fpop2=feval(fit22,temp);
plot(temp,fpop2,'k-');
hold off;


% %�Զ���ģ��
% mymodel2 = fittype('a*exp(b./x)');  %('x./(a*x+b)');
% %�������������
% [fit22,gof2,out2]= fit(temp,thermex,mymodel2)
% %����ɢ��ͼ���������
% figure('color','white');
% title('���Զ���ģ��2���');
% hold on;
% plot(temp,thermex,'*');
% temp=min(temp):0.1:max(temp);
% fpop2=feval(fit22,temp);
% plot(temp,fpop2,'k-');
% hold off;
