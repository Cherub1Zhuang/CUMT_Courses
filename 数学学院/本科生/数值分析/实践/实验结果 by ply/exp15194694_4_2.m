function lnddd
eps=10^-8;N=100000;
x0=-5
[x1,kx1]=cnewton_interation_rule(@f,@df,x0,eps,N);
[x2,kx2]=cnewton_interation_rule(@df,@ddf,x0,eps,N);
x0=1;  
[y1,ky1]=cnewton_interation_rule(@f,@df,x0,eps,N);
[y2,ky2]=cnewton_interation_rule(@df,@ddf,x0,eps,N);
x1,x2,y1,y2
for x0=-100000:100:0
    [x,kx]=cnewton_interation_rule(@f,@df,x0,eps,N);
end
for x0=0:100:100000
    [x,kx]=cnewton_interation_rule(@f,@df,x0,eps,N);
end
for x0=-100000:100:0
    [x,kx]=cnewton_interation_rule(@df,@ddf,x0,eps,N);
end
for x0=0:100:100000
    [x,kx]=cnewton_interation_rule(@df,@ddf,x0,eps,N);
end
function y=f(x)
y=0.1*exp(x)-sin(x).^2+0.5;
function y=df(x)
y=0.1*exp(x)-sin(2*x);
function y=ddf(x)
y=0.1*exp(x)-2*cos(2*x);