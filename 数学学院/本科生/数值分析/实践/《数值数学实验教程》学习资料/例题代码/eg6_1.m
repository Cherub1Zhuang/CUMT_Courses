function eg6_1
%����6.1������eg6_1.m
load b6_2.mat
xi = min(x):.25:max(x); 
%yi=clagrange_interp(x,y,xi);
[yi,A]=cnewton_interp(x,y,xi); 
figure('color','white');
hold on
plot(xi,yi,'ko--','LineWidth',1); %��ֵ����
plot(xi,sin(sin(xi)),'k-','LineWidth',2); %ʵ�ʺ���
axis([min(x),max(x),-1.1,1.1]); 
title('����ͼ�����ߣ�');
hold off
