%����1.5����eg1_5.m
clear all��
savefile = 'pqfile.mat';
p = rand(1, 10);
q = ones(10);
save(savefile, 'p', 'q')
