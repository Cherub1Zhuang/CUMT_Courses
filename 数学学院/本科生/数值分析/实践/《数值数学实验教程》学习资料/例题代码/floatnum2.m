%ÀıÌâ2.2³ÌĞò£ºfloatnum2.m 
A=10;B=11;C=12;D=13;E=14;F=15;
p=[E,1,A,8,C,6,D];
beta=16;e=-1;n=6;
format long;
a=-polyval(p,beta)*beta^(e-n)
format short;
