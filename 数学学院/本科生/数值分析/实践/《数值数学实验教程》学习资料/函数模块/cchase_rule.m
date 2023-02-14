function [x,q,p]=cchase_rule(a,b,c,d)
%׷�Ϸ����nԪ���Խ����Է�����
%���룺a---�´ζԽ�����Ԫ�أ����һ��Ԫ�ز�0��ʹ��ΪnԪ������
%���룺b---���Խ�����Ԫ�أ�
%���룺c---�ϴζԽ�����Ԫ�أ����n��Ԫ�ز�0��ʹ��ΪnԪ������
%���룺d---�Ҷ���������
%�����x---��������p,q---�м�����
n=length(b);
p=ones(n,1);q=ones(n,1);

if length(a)~=n||length(d)~=n
    error('The inputed datas have errors!');
else
    p(1)=d(1)/b(1);q(1)=c(1)/b(1);
    for k=2:n
        t=b(k)-a(k)*q(k-1);
        p(k)=(d(k)-a(k)*p(k-1))/t;
        q(k)=c(k)/t;
    end
end

x=ones(n,1);
x(n)=p(n);
for k=n-1:-1:1
    x(k)=p(k)-q(k)*x(k+1);
end
