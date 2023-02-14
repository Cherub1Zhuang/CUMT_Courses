function sfxl
%例题3.7主程序：sfxl.m 绘制多项式的图像
a=[5,4,2,-3,4,-5];x=-5:0.05:5;
%调用下面两个函数要用降幂系数行向量
y=czjfp(a,x);
yy=cqjsp(a,x);
%调用下面函数要用升幂系数行向量
a=[-5,4,-3,2,4,5];
yyy=cfzfp(a,x);
figure('color','white');plot(x,y,'k-');
figure('color','white');plot(x,yy,'k-');
figure('color','white');plot(x,yyy,'k-');
