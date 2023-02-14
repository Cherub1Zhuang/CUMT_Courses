%例题6.5主程序：eg6_5.m
[X,Y]=meshgrid(-3:1:3);Z=peaks(X,Y); %产生插值数据

figure('color','white');
peaks  %显示山峰图像 

figure('color','white');
surf(X,Y,Z);title('第（3）步复原图');

figure('color','white');
[xi,yi]=meshgrid(-3:0.25:3); %产生插值点数据
zi1=interp2(X,Y,Z,xi,yi,'nearest');
surf(xi,yi,zi1);title('第（4）步复原图');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'bilinear');
surf(xi,yi,zi1);title('第（5）步复原图');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'cubic');
surf(xi,yi,zi1);title('第（6）步复原图');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'spline');
surf(xi,yi,zi1);title('第（7）步复原图');