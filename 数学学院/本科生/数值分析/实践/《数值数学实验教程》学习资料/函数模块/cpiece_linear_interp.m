function yy=cpiece_linear_interp (x,y,xx)
%�ֶ����Բ�ֵ����ģ��
%���룺��ֵ�ڵ�����x����Ӧ�ĺ���ֵ����y����ֵ������xx��
%�������ֵ���yy��
yy=zeros(size(xx));
n=length(x);
for k=1:n-1
    %�жϲ�ֵ�����ڵ�С����
    ll=xx>=x(k) & xx<x(k+1);
    uk=(xx(ll)-x(k))/(x(k+1)-x(k));
    yy(ll)=y(k)*(1-uk)+y(k+1)*uk;
end
ll=xx==x(n);
yy(ll)=y(n);
