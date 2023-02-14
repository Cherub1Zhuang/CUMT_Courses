function zzz
%例题7.3主程序：eg7_3.m
%载入数据
load hahn;
whos
%进行有理函数拟合
[fit22,gof2,out2]= fit(temp,thermex,'rat55')
%绘制散点图及拟合曲线
figure('color','white');
title('用rat55模型拟合');
hold on;
plot(temp,thermex,'*');
temp=min(temp):0.1:max(temp);
fpop2=feval(fit22,temp);
plot(temp,fpop2,'k-');
hold off;
