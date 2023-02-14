function yy=cpiece3_hermite_interp(x,y,dy,xx)
%�ֶ�����Hermite��ֵ������ģ��
%���룺����x,y������ֵ���ݣ�dy�ڵ㴦һ�׵���������xx������ֵ��������
%���������xx�Ĳ�ֵ�������yy��H3(xx)��
yy=zeros(size(xx));
n=length(x);
h=zeros(n-1);
for k=1:n-1
    h(k)=x(k+1)-x(k);
    l=xx>=x(k) & xx<x(k+1);
    u=(xx(l)-x(k))/h(k);
    yy(l)=y(k)*fai0(u)+y(k+1)*fai0(1-u)...
        + dy(k)*h(k)*fai1(u)-dy(k+1)*h(k)*fai1(1-u);
end
ll=xx==x(n);
yy(ll)=y(n);

function y=fai0(x)
y=zeros(size(x));
y=(1+2*x).*(1-x).^2;

function y=fai1(x)
y=zeros(size(x));
y=x.*(1-x).^2;
