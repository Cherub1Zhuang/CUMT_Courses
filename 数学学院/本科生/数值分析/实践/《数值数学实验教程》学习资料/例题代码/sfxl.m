function sfxl
%����3.7������sfxl.m ���ƶ���ʽ��ͼ��
a=[5,4,2,-3,4,-5];x=-5:0.05:5;
%����������������Ҫ�ý���ϵ��������
y=czjfp(a,x);
yy=cqjsp(a,x);
%�������溯��Ҫ������ϵ��������
a=[-5,4,-3,2,4,5];
yyy=cfzfp(a,x);
figure('color','white');plot(x,y,'k-');
figure('color','white');plot(x,yy,'k-');
figure('color','white');plot(x,yyy,'k-');
