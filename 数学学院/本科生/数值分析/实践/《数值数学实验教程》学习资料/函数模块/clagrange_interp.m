function yy=clagrange_interp(x,y,xx)
%һԪLagrange��ֵ������ģ��
%�����룺����x��yΪ��ֵ�������ݣ��ֱ��ʾ��ֵ�ڵ����Ӧ����ֵ��
%�����룺xxΪ��ֵ��������
%  �����yyΪ��Ӧ��Lagrange��ֵ��Ϊ���ƺ���ֵ
yy=zeros(size(xx));
n=length(x);
for k=1:n
	%���ۻ������k����������ֵ
    tt=ones(size(xx));
    for j=1:n
        if j~=k
            tt=tt.*(xx-x(j))./(x(k)-x(j));
        end
    end
%�����ۺͷ����Ӧ�Ĳ�ֵ
    yy=yy+y(k)*tt;
end
