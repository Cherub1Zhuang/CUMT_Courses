function s=csimpson_integral_rule2(x,y)
%��֪���������ڵȾ�ڵ���ɢ����ʱ����Simpson��ʽ����ģ��
%���룺���������ڵȾ�ڵ�x�ϵĺ���ֵy,Ҫ��ڵ�����Ϊ����
%��������ֽ��s
n=length(x);m=length(y);
if m~=n	
    error('���ݲ��ɶԣ�');
end
if rem(n,2)~=1
    error('���ݲ��������ԣ�');
end

%�󲽳�
h=[];
for i=1:n-1
    h=[h,x(i+1)-x(i)];
end
%����Ƿ�Ϊ�Ⱦ�ڵ�
l=h==h(1);
if all(l)~=1
    error('���ǵȾ�ڵ㣡');
end

%�ù�ʽ(8.19)�������
y12=y(2:2:n);y=y(1:2:n);
nn=length(y);
s=y(1)+4*y12(1)+y(nn);
for i=2:nn-1
   s=s+4*y12(i)+2*y(i);
end
s=s*h(1)/3;
