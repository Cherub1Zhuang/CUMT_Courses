function [cx,bx,dx] = generate_k_messages(k)
%GENERATE_K_MESSAGES 生成所有k长的二进消息序列
%   cx表示字符型消息序列，bx双精度二进数组形式消息序列，dx十进制整数形式消息序列
dx=0:2^k-1;
cx=dec2bin(dx);
bx=de2bi(dx);
end