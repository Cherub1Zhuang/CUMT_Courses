%����6.5������eg6_5.m
[X,Y]=meshgrid(-3:1:3);Z=peaks(X,Y); %������ֵ����

figure('color','white');
peaks  %��ʾɽ��ͼ�� 

figure('color','white');
surf(X,Y,Z);title('�ڣ�3������ԭͼ');

figure('color','white');
[xi,yi]=meshgrid(-3:0.25:3); %������ֵ������
zi1=interp2(X,Y,Z,xi,yi,'nearest');
surf(xi,yi,zi1);title('�ڣ�4������ԭͼ');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'bilinear');
surf(xi,yi,zi1);title('�ڣ�5������ԭͼ');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'cubic');
surf(xi,yi,zi1);title('�ڣ�6������ԭͼ');

figure('color','white');
zi1=interp2(X,Y,Z,xi,yi,'spline');
surf(xi,yi,zi1);title('�ڣ�7������ԭͼ');