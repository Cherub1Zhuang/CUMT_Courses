%����2.5������ floatnum4.m
function floatnum4
%����p=17��ָ��λ��k=4,����λs=1.
p=17;k=5;
a.mode='float';a.roundmode='nearest';a.format=[p+k+1,k];
q=quantizer(a);
get(q)   %��ʾ������ϵͳ��Ϣ

%��������
x=quantize(q,51234);
disp('51234�ļ������');disp(x);
y=quantize(q,0.1);
disp('0.1�ļ������');disp(y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('���ô��������������ӵ�˳�����');
N=10000;
for i=1:N   
    x=quantize(q,x+y);%ÿ��һ��0.1��Ҫ����һ�Ρ�
end
disp('�������ļ������');disp(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('���ú����10000��0.1�ȼ�,Ȼ���ټӵ�51234��');
z=0;
for i=1:N
    z=quantize(q,z+y);
end
x=quantize(q,x+z);
disp('�������ļ������');disp(x);

