function yy=cnearest_neighbor_interp(x,y,xx)
%���ڽ���ֵ������ģ��
%���룺��ֵ�ڵ�����x����Ӧ�ĺ���ֵ����y����ֵ������xx��
%�������ֵ���yy��
yy=zeros(size(xx));
n=length(x);
h=x(2:end)-x(1:end-1);
%��˵�
ll=xx<x(1);
y(ll)=y(1);
%�Ҷ˵�
ll=xx>=x(n);
y(ll)=y(n);
%�м���     
for k=2:n-1
    %�жϲ�ֵ������ĸ���
    ll=xx>=x(k)-h(k-1)/2 & xx<x(k)+h(k)/2;
    yy(ll)=y(k);
end
