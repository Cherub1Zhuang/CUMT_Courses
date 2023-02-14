% 练习 8.4 n=10 时 
sn1=0; 
sn2=0; 
x1=0.1:0.1:0.9; 
x2=0.05:0.1:0.95; 
for i=1:9
    sn1=sn1+sin(x1(i))/x1(i); 
end 
for j=1:10
    sn2=sn2+sin(x2(j))/x2(j); 
end
sn=(1+sin(1)/1+4*sn2+2* sn1)/60 
%练习 8.4 n=20 时
sn1=0; 
sn2=0; 
x1=0.05:0.05:0.95; 
x2=0.025:0.05:0.975; 
for i=1:length(x1) 
    sn1=sn1+sin(x1(i))/x1(i); 
end 
for j=1:length(x2)
    sn2=sn2+sin(x2(j))/x2(j); 
end 
sn=(1+sin(1)/1+4*sn2+2* sn1)/120