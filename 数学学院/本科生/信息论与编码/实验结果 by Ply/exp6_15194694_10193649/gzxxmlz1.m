function zzz
%����һ��(n,k)���Է�����gzxxmlz1.m
%���ɾ���
G=[1 0 0 0 1 1;
   0 1 0 0 1 0;
   0 0 1 0 0 0;
   0 0 0 1 0 1];
[k,n]=size(G);
 
%��������k���Ķ�����Ϣ���ַ�����������ʽ��
x=0:2^k-1;mx=dec2bin(x);msg=de2bi(x);
%���ɶ���������,Ϊ������ʽ
Cb=encode(msg,n,k,'linear/binary',G);
%��������������ʽת����ת�ɴ�
Cd=bi2de(Cb);Cs=dec2bin(Cd);Cs=Cs(:,end:-1:1);

%��������k����ʮ����Ϣ����
msg=0:2^k-1;
Cd=encode(msg,n,k,'linear/decimal',G);

%��ʾÿ����Ϣ�������Ӧ����������
kg=[];
for i=1:2^k
    kg=[kg;blanks(5)];
end
disp([int2str(x'),kg,mx,kg,Cs,kg,num2str(Cd')]);
%����С��������
wt = gfweight(G,'gen')
