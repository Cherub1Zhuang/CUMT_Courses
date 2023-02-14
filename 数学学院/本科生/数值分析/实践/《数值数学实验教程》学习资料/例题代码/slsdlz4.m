%例题4.6主程序：slsdlz4.m 
function slsdlz4
epsilon=10^-8;N=1000;
x0=-10;x1=10;
[x,kx]=cscant_interation_rule(@f,x0,x1,epsilon,N);
ek=kx(:,2)-1;  %求误差
ek=abs(ek);
l=ek<epsilon;
ek(l)=[];
u=log(ek)
[fit1,gof1,out1] = fit(u(1:end-1),u(2:end),'poly1')  %拟合
figure('color','white');
hold on;
plot(u(1:end-1),u(2:end),'k*');  %绘制散点图
uu=u(1:end-1);
uy=feval(fit1,uu);
plot(uu,uy,'k-');  %绘制拟合后直线
hold off;

function y=f(x)
y=(x-1)+(x-1).^3;
