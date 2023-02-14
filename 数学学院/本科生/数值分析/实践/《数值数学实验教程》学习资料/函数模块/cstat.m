% 函数文件名:cstat.m
function [mean,stdev]=cstat(x)
n=length(x);
mean=sum(x)/n;
stdev=sqrt(sum((x-mean).^2/n));
