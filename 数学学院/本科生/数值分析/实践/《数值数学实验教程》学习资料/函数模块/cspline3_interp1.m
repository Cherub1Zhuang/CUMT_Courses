function [yy,m]=cspline3_interp1(x,y,condnum,condval,xx)
%������������ֵ����ת�Ƿ�����ģ��
%���룺��ֵ�ڵ�x���߽������ż���ֵcondnum,condval����ֵ��xx
%������ڵ㴦һ�׵���ֵm����ֵ�㴦����ֵyy

%��ڵ������
n=length(x)-1;

%��ʼ��Ҫ�õ�������
h=zeros(1,n);lamda=zeros(1,n);mu=zeros(1,n);g=zeros(1,n);
%����6.36���󲽳������е�Ԫ��
h=x(2:n+1)-x(1:n);
%����6.38������ת�Ƿ�������Ԫ�أ�
%��������lamda(2:n)��mu(2:n)��g(2:n)
for i=1:n-1
    lamda(i+1)=h(i+1)/(h(i)+h(i+1));
    mu(i+1)=1-lamda(i+1);
    dy1=(y(i+1)-y(i))/h(i);
    dy2=(y(i+2)-y(i+1))/h(i+1);
    g(i+1)=3*(lamda(i+1)*dy1+mu(i+1)*dy2);
end

%����ͬ�߽�������
switch condnum
    case 1
        %��һ�ֱ߽�������
        a=lamda(2:n);b=2*ones(1,n-1);c=mu(2:n);
        g(2)=g(2)-lamda(2)*condval(1);
        g(n)=g(n)-mu(n)*condval(2);
        d=g(2:n);
		%�������ԽǷ������׷�Ϸ������������һ�׵���
        m=cchase_rule(a,b,c,d);
        m=[condval(1);m;condval(2)];
        yy=cpiece3_hermite_interp(x,y,m,xx);
    case 2
        %�ڶ��ֱ߽�������
        a=[0,lamda(2:n),1];b=2*ones(1,n+1);c=[1,mu(2:n),0];
        g0=3*(y(2)-y(1))/h(1)-h(1)/2*condval(1);
        gn=3*(y(n+1)-y(n))/h(n)+h(n)/2*condval(2);
        g=[g0,g(2:n),gn];
		%�������ԽǷ������׷�Ϸ������������һ�׵���
        m=cchase_rule(a,b,c,g);
        yy=cpiece3_hermite_interp(x,y,m,xx);        
    case 3
        %�����ֱ߽�������
        lamdan=h(1)/(h(1)+h(n));mun=1-lamdan;
        a=[lamda(3:n),lamdan];b=2*ones(n,1);c=mu(2:n);
        A=diag(b)+diag(a,-1)+diag(c,1);
        A(1,n)=lamda(2);A(n,1)=mun;
        dy1=(y(2)-y(1))/h(1);dy2=(y(n+1)-y(n))/h(n);
        gn=3*(mun*dy1+lamdan*dy2);
        b=[g(2:n),gn];
		%��������Ԫ�ط����������ԽǷ����鼴�������һ�׵���
        m=cgauss_partial_pivoting_elimination(A,b,10^-8);
        m=[m(n);m];
        yy=cpiece3_hermite_interp(x,y,m,xx);
    otherwise
        error('�߽��������������');        
end
