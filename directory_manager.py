import os

def isChinese(word):
    for ch in word:
        if '\u4e00' <= ch <= '\u9fff':
            return True
    return False

def make_dir(path):
    path=os.path.join(path,"示例课程")
    path1=os.path.join(path,"PPT")
    path2=os.path.join(path,"试卷")
    path3=os.path.join(path,"教材")
    path4=os.path.join(path,"其他资料")
    os.makedirs(path1)
    os.makedirs(path2)
    os.makedirs(path3)
    os.makedirs(path4)

def add_readme(path):
    list=os.listdir(path)
    # for item in list:
    #     path1=os.path.join(path,item)
    #     list1=os.listdir(path1)
    #     for item1 in list1:
    #         path2=os.path.join(path1,item1,"Readme.md")
    #         # with open(path2,'w',encoding='utf-8') as f:
    #         #     f.writelines("# Readme")
    #         #     f.close()
    #         print (path2)
    if list:
        for item in list:
            path1=os.path.join(path,item)
            add_readme(path1)
    else:
        path2=os.path.join(path,"Readme.md")
        with open(path2,"w")as f:
            f.writelines("# 实例文件")
def del_dir(path):
    if os.path.isfile(path):
        os.remove(path)
    else:
        list=os.listdir(path)
        if(list):
            for item in list:
                del_dir(os.path.join(path,item))
        else:
            os.rmdir(path)

root=os.getcwd()
list=os.listdir(root)
print(root)
print(list)
for item in list:
    if isChinese(item) and item != "文件上传教程.md":
        file_path=os.path.join(root,item)
        dir1=os.path.join(file_path,"本科生")
        dir2=os.path.join(file_path,"研究生")

        del_dir(dir1)
        if not os.path.exists(dir1):
            os.makedirs(dir1)
        make_dir(dir1)

        del_dir(dir2)
        if not os.path.exists(dir2):
            os.makedirs(dir2)
        make_dir(dir2)
        add_readme(file_path)
