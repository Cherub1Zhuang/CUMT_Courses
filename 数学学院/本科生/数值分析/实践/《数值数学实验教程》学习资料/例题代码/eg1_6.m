%ÀýÌâ1.6³ÌÐò£ºeg1_6.m
clear all;
s1.a = 12.7;
s1.b = {'abc', [4 5; 6 7]};
s1.c = 'Hello!';
save('newstruct.mat', '-struct', 's1');
disp('Contents of newstruct.mat:');
whos('-file', 'newstruct.mat');
clear('s1');
whos;
load('newstruct.mat', 'b');
whos;
