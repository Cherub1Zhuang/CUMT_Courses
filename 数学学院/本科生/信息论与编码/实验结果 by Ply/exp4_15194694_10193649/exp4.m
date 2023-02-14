pf=[0.05,0.29,0.07,0.08,0.14,0.23,0.03,0.11];
hufftree=chuffman_tree(pf);
m=length(hufftree);
H=[];
for i=1:m
    H=[H;i,hufftree(i).frequency,hufftree(i).parent,hufftree(i).left_child,hufftree(i).right_child];
end
H
[huff_code,code_length]=chuffman_encode(hufftree)