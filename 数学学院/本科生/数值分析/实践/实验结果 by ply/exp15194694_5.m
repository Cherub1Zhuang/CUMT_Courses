function lfj
A5=zd(5);
A50=zd(50);
A100=zd(100);
[L5,U5]=lu(A5);
[L50,U50]=lu(A50);
[L100,U100]=lu(A100);
[C5,p]=chol(A5);
[C50,p]=chol(A50);
[C100,p]=chol(A100);
save('exp15194694_5_1.mat','A5','A50','A100');
save('exp15194694_5_2.mat','L5','L50','L100','U5','U50','U100','C5','C50','C100');

function A=zd(n)
p=1;
while p~=0
    A=randi([5 10],n,n);
    A=A+A';
    for i=1:n
        A(i,i)=A(i,i)+100;
    end
    [R,p]=chol(A);
end