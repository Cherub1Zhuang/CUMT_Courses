function [yy,A]=cnewton_interp(x,y,xx)
% Newton��ֵ������ģ��
%���룺����x��yΪ��ֵ�������ݣ��ֱ��ʾ��ֵ�ڵ����Ӧ����ֵ��
%�����xxΪ��ֵ��������
%�����yyΪ��Ӧ�ڵ�Newton��ֵ��Ϊ���ƺ���ֵ
%�����AΪţ�ٲ��̱�
m=length(xx);
n=length(x);
%����̱�
A=cnewton_divided_difference(x,y);
yy=zeros(size(xx));
for k=1:n
    % ����(6.15)���k-1����������ֵw(xx)
	w=ones(size(xx));
    for i=1:k-1
        w=w.*(xx-x(i));
    end
    %����(6.18)���ֵ�����ֵN(xx)
    yy=yy+A(k,k+1)*w;
end
