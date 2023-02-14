%二分法函数模块：cbisection_rule.m 
function [x,abx]=cbisection_rule(f,interval,epsilon,N)
%　输入：函数句柄@f，隔根区间interval(1:2)，精度epsilon，最大二分次数N
%　输出：近似根x，二分过程中的小区间及其中点数组abx，
%  第一列为区间左端点，第二列为区间右端点，第三列为近似根即区间中点
f=fcnchk(f);
%为二分准备初始数据
a=interval(1);b=interval(2);
l=b-a;n=1;
x=[];abx=[];
%开始二分
while l>epsilon & n<=N 
    x=(a+b)/2;  %求区间中点
    abx=[abx;a,b,x]; %保存中间数据；
    fx=feval(f,x);
    if abs(fx)<=eps
        break;
    elseif sign(feval(f,a))*sign(fx)<0  %选择下一个隔根区间
        b=x;
    else
        a=x;
    end
    l=b-a;
    n=n+1;
end
if n>N 
    warning('已经达到二分次数上限，输出的根未达到精度要求。');
end
