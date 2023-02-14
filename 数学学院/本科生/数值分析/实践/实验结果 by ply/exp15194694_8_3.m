%练习 8.11 (2) 
interval=[0,3]; 
a=interval(1);
b=interval(2);
h=b-a; 
syms x 
y=x*sqrt(1+x^2); 
Told=eval(subs(y,x,a))+eval(subs(y,x,b)); 
Sold=NaN;Cold=NaN;
Rold=NaN; 
A=[0,Told,Sold,Cold,Rold];
for i=1:9 
    intervalx=a+h/2:h:b-h/2; 
    sumy=0; 
    for j=1:length(intervalx) 
        sumy=sumy+eval(subs(y,x,intervalx(j))); 
    end 
    Tnew=0.5*Told+0.5* h*sumy; 
    Snew=(4*Tnew-Told)/3; 
    Cnew=(16*Snew-Sold)/15;
    Rnew=(64*Cnew-Cold)/63; 
    A=[A;i,Tnew,Snew,Cnew, Rnew]; 
    h=h/2; Told=Tnew;
    Sold=Snew;Cold=Cnew;Rold=Rnew; 
end
A