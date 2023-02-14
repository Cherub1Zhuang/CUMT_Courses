function zzz
%非标准阵列伴随式例子stdbsslz2.m
G=[1 0 0 0 0  1 0
   0 1 1 1 0  1 0
   0 0 1 1 1  0 1
   1 1 0 0 0  0 0]; 
SA=cstd_array(G)
H=cgen2par(G);
H=double(H~=0);
T=syndtable(H);
Td=bi2de(T);
Ts=dec2bin(Td);
Ts=Ts(:,end:-1:1)
