function eg6_7
%例题6.7主程序：eg6_7.m
x=[1,2,3,4,5,6,7,8,9,10];
y=[3.5598,2.5580,1.5367,0.5272,0.2625,...
        0.9019,1.8106,2.1225,1.5296,0.5611];
%用非扭结条件作为边界条件
pp=csape(x,y,'not-a-knot');
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('非扭结条件');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%用第一边界条件
valcond=[-2.1780,-0.8501];
pp=csape(x,y,'complete',valcond);
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('第一边界条件');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%用第二边界条件
valcond=[-3.5598 0.5419];
pp=csape(x,y,'second',valcond);
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('第二边界条件');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%用自然边界条件
pp=csape(x,y,'second');
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('自然边界条件');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

