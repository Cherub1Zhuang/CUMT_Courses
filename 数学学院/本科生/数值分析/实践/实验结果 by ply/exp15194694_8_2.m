%练习 8.11 (1) 
interval=[-1,1]; 
a=interval(1);b=interval(2); 
h=b-a; 
syms x 
y=sin(x)/x; 
Told=eval(subs(y,x,a))+eval(subs(y,x,b)); 
Sold=NaN;Cold=NaN;Rold=NaN; 
A=[0,Told,Sold,Cold,Rold]; 
Tnew=0.5*Told+0.5*h*1; 
Snew=(4*Tnew-Told)/3; 
Cnew=(16*Snew-Sold)/15; 
Rnew=(64*Cnew-Cold)/63; 
A=[A;1,Tnew,Snew,Cnew,Rnew];
h=h/2; 
for i=2:10
    intervalx=a+h/2:h:b-h/2; 
    sumy=0; 
    for j=1:length(intervalx) 
        sumy=sumy+eval(subs(y,x,intervalx(j))); 
    end 
    Tnew=0.5*Told+0.5*h*sumy;
    Snew=(4*Tnew-Told)/3; 
    Cnew=(16*Snew-Sold)/15; 
    Rnew=(64*Cnew-Cold)/63; 
    A=[A;i,Tnew,Snew,Cnew,Rnew]; 
    h=h/2; 
    Told=Tnew;Sold=Snew;Cold=Cnew;Rold=Rnew; 
end
A