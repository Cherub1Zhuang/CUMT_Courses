function t=ctrapezoidal_integral_rule2(x,y)
%��֪������������ɢ���ݱ�ʾʱ���Ⱦ�ڵ㸴�����ι�ʽ����ģ��
%���룺������������ɢ���ݶ�����x,y
%��������ֽ��t
n=length(x);m=length(y);
if m~=n
    error('���ݸ�����ƥ�䣡');
end

h=[];%�󲽳�����
for i=1:n-1
    h=[h,x(i+1)-x(i)];
end
%�ù�ʽ(8.12)�������
t=0;
for i=1:n-1
    t=t+h(i)*(y(i)+y(i+1));
end
t=t/2;
