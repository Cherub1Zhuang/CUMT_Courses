function eg6_2
%����6.2������eg6_2.m
x=0:pi/4:3*pi; 
y=sin(x);
xi = 0:.25:3*pi; 
%yi=cpiece_linear_interp (x,y,xi);
%dy=cos(x);
%yi=cpiece3_hermite_interp(x,y,dy,xi);
yi=cnearest_neighbor_interp(x,y,xi); 
figure('color','white');
plot(x,y,'ko',xi,yi,'k-','LineWidth',1);
axis([0,3*pi,-1.1,1.1]); 
title('���ڽ���ֵ��');
