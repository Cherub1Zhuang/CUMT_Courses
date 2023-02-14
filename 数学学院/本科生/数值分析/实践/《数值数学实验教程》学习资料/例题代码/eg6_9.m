function eg6_9
%����6.9�źŴ����ļ���:eg6_9.m
%׼�������ź�����
clear all;
t=0:0.001:4.3;
y=sin(2*pi*50*t)+sin(2*pi*120*t)+2*randn(size(t));
save('signa.mat');
clear all
load signa.mat;%װ������
whos

%����ʱ���ڵ��ź�
figure('Color','white');
plot(1000*t(1:64),y(1:64),'k-','LineWidth',2);
title('ʱ�������ź�');
xlabel('time (milliseconds)');
ylabel('magnitude');

%���������ݵ�ͼ��
figure('Color','white');
Y=fft(y,4096);
py=abs(Y);%�������
ay=angle(Y);%����λ��
f = 1000*(0:4095)/4096;%��Ƶ��
plot(f(1:640),py(1:640),'k-','LineWidth',2); 
title('�������ź�');
xlabel('frequency (Hz)');
ylabel('magnitude');

% %��λ�����ݵ�ͼ��
% figure('Color','white');
% f = 1000*(0:4095)/4096;%��Ƶ��
% plot(f(1:64),ay(1:64),'k-','LineWidth',2); 
% title('��λ�����');
% xlabel('frequency (Hz)');
% ylabel('magnitude');

%������С��Ƶ�ʷ�����ý���������
figure('Color','white');
k1=1600;k2=400;%��ֵ
l=py>k1;ll=py<k2;lll=~l&~ll;
Y(l)=1;Y(ll)=0; Y(lll)=-1;
%�Խ��������ݽ�����任����ͼ
yy=ifft(Y,4096);
yy=real(yy);%ֻȡʵ�����鲿��С��
plot(1000*t(1:128),yy(1:128),'k-','LineWidth',2);
title('��ֵ��IDFT�ź�');
xlabel('time (milliseconds)');
ylabel('magnitude');

%��ʵ�ź�ͼ��
figure('Color','white');
t=0:0.001:0.14;
y=sin(2*pi*50*t)+sin(2*pi*120*t);
plot(1000*t,y,'k-','LineWidth',2);
title('��ʵ�ź�');
xlabel('time (milliseconds)');
ylabel('magnitude');
