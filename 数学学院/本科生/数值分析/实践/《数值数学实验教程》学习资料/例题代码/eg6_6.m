function eg6_6
%例题6.6主程序
x=[1,2,4,5];y=[1,3,4,2];
%求样条函数并画图
valcond=[17/8,-19/8];
pp=csape(x,y,'complete',valcond)
xx=1:0.1:5;
yy=ppval(pp,xx);
figure('color','white');
hold on;
plot(x,y,'ko');
plot(xx,yy,'k-');
hold off;
