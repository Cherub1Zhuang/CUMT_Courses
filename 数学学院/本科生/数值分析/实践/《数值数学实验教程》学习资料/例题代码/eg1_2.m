%����1.2������eg1_2.m 
function eg1_2
x=-pi:0.1:pi;
x=x+randn(size(x))
[mean,stdv]=cstat(x)
