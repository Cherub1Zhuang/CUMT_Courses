%����ʽ��ֵ��ֱ�ӷ�����ģ�飺czjfp.m 
function y=czjfp(a,x)
%  ֱ�ӷ������ʽֵ
%  ���룺aΪ���ݶ���ʽ�Ľ���ϵ��������
%  ���룺xΪ�Ա���
n=length(a);
y=zeros(size(x));
w=ones(size(x));
%����ֵ
for i=1:n    
    y=y+a(n-i+1)*w;
    w=w.*x;
end
