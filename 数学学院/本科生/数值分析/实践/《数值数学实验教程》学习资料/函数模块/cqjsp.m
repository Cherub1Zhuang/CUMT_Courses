%�ؾ����㷨����ģ�飺cqjsp.m
function y=cqjsp(a,x)
%����aΪ���ݶ���ʽ�Ľ���ϵ����������
%xΪ�Ա�����������
y=zeros(size(x));
n=length(a);
y=a(1);
for i=2:n
    y=a(i)+y.*x;
end
