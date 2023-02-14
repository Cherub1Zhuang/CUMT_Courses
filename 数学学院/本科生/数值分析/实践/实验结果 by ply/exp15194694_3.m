function lint
a=0.05;
A=ldd1(a)';
B=ldd2(a)';
a=15;
C=ldd1(a)';
D=ldd2(a)';
save('exp15194694_3.mat','A','B','C','D')

function A=ldd1(a)
I0=str2num(num2str(log((a+1)/a),4));
A=zeros(10,2);A(1,1)=1;A(1,2)=-a*I0+1;
for i=1:9
    A(i+1,1)=i+1;
    A(i+1,2)=-a*A(i,2)+1/(i+1);
end
A=[0,I0;A];

function B=ldd2(a)
B=zeros(10,2);B(10,1)=10;B(10,2)=str2num(num2str((1/((a+1)*11)+1/(a*11))/2,4));
for i=10:-1:2 
    B(i-1,1)=i-1;
    B(i-1,2)=(-B(i,2)+1/i)/a;
end
I0=(-B(1,2)+1)/a;
B=[0,I0;B];

