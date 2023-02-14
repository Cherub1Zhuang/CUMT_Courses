function ccensus
%例题7.2主程序：ccensus.m
%装载数据
load census
%进行二次多项式拟合
[fit2,gof2,out2]= fit(cdate,pop,'poly9') %不用分号，便于看它的输出结果。
%画出散点图及拟合曲线
figure('color','white');
title('9次多项式拟合');
hold on;
plot(cdate,pop,'*');
fpop2=feval(fit2,cdate);
plot(cdate,fpop2,'k-');
hold off;
