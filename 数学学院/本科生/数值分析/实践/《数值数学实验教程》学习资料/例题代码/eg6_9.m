function eg6_9
%例题6.9信号处理，文件名:eg6_9.m
%准备有噪信号数据
clear all;
t=0:0.001:4.3;
y=sin(2*pi*50*t)+sin(2*pi*120*t)+2*randn(size(t));
save('signa.mat');
clear all
load signa.mat;%装载数据
whos

%画出时域内的信号
figure('Color','white');
plot(1000*t(1:64),y(1:64),'k-','LineWidth',2);
title('时域有噪信号');
xlabel('time (milliseconds)');
ylabel('magnitude');

%幅度谱数据的图像
figure('Color','white');
Y=fft(y,4096);
py=abs(Y);%求幅度谱
ay=angle(Y);%求相位谱
f = 1000*(0:4095)/4096;%求频率
plot(f(1:640),py(1:640),'k-','LineWidth',2); 
title('幅度谱信号');
xlabel('frequency (Hz)');
ylabel('magnitude');

% %相位谱数据的图像
% figure('Color','white');
% f = 1000*(0:4095)/4096;%求频率
% plot(f(1:64),ay(1:64),'k-','LineWidth',2); 
% title('相位谱序号');
% xlabel('frequency (Hz)');
% ylabel('magnitude');

%舍弃较小的频率分量获得近似谱数据
figure('Color','white');
k1=1600;k2=400;%阀值
l=py>k1;ll=py<k2;lll=~l&~ll;
Y(l)=1;Y(ll)=0; Y(lll)=-1;
%对近似谱数据进行逆变换并作图
yy=ifft(Y,4096);
yy=real(yy);%只取实部，虚部较小。
plot(1000*t(1:128),yy(1:128),'k-','LineWidth',2);
title('阀值后IDFT信号');
xlabel('time (milliseconds)');
ylabel('magnitude');

%真实信号图像
figure('Color','white');
t=0:0.001:0.14;
y=sin(2*pi*50*t)+sin(2*pi*120*t);
plot(1000*t,y,'k-','LineWidth',2);
title('真实信号');
xlabel('time (milliseconds)');
ylabel('magnitude');
