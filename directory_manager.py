import os

def isChinese(word):
    for ch in word:
        if '\u4e00' <= ch <= '\u9fff':
            return True
    return False

def make_dir(path):
    path1=os.path.join(path,"PPT")
    path2=os.path.join(path,"试卷")
    path3=os.path.join(path,"教材")
    path4=os.path.join(path,"其他资料")
    os.makedirs(path1)
    os.makedirs(path2)
    os.makedirs(path3)
    os.makedirs(path4)

root=os.getcwd()
list=os.listdir(root)
print(root)
print(list)
for item in list:
    if isChinese(item):
        file_path=os.path.join(root,item)
        dir1=os.path.join(file_path,"本科生")
        dir2=os.path.join(file_path,"研究生")
        os.makedirs(dir1)
        make_dir(dir1)
        os.makedirs(dir2)
        make_dir(dir2)
