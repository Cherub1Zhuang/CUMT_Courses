function eg7_4
%例题7.4主程序：eg7_4.m
%载入数据
load hahn;
%自定义模型
mymodel2 = fittype('x./(a*x+b)');
%进行有理函数拟合
[fit22,gof2,out2]= fit(temp,thermex,mymodel2)
%绘制散点图及拟合曲线
figure('color','white');
title('用自定义模型1拟合');
hold on;
plot(temp,thermex,'*');
temp=min(temp):0.1:max(temp);
fpop2=feval(fit22,temp);
plot(temp,fpop2,'k-');
hold off;


% %自定义模型
% mymodel2 = fittype('a*exp(b./x)');  %('x./(a*x+b)');
% %进行有理函数拟合
% [fit22,gof2,out2]= fit(temp,thermex,mymodel2)
% %绘制散点图及拟合曲线
% figure('color','white');
% title('用自定义模型2拟合');
% hold on;
% plot(temp,thermex,'*');
% temp=min(temp):0.1:max(temp);
% fpop2=feval(fit22,temp);
% plot(temp,fpop2,'k-');
% hold off;
