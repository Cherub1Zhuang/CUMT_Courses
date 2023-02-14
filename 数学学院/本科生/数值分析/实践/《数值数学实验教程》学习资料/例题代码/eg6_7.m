function eg6_7
%����6.7������eg6_7.m
x=[1,2,3,4,5,6,7,8,9,10];
y=[3.5598,2.5580,1.5367,0.5272,0.2625,...
        0.9019,1.8106,2.1225,1.5296,0.5611];
%�÷�Ť��������Ϊ�߽�����
pp=csape(x,y,'not-a-knot');
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('��Ť������');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%�õ�һ�߽�����
valcond=[-2.1780,-0.8501];
pp=csape(x,y,'complete',valcond);
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('��һ�߽�����');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%�õڶ��߽�����
valcond=[-3.5598 0.5419];
pp=csape(x,y,'second',valcond);
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('�ڶ��߽�����');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

%����Ȼ�߽�����
pp=csape(x,y,'second');
xx=1:0.1:10;
yy=ppval(pp,xx);
figure('color','white');
hold on;
title('��Ȼ�߽�����');
plot(x,y,'bo');
plot(xx,yy,'k-','linewidth',2);
hold off;

