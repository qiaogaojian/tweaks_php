### 下载 git

[下载地址](https://link.jianshu.com/?t=https://git-scm.com/download/win)

### 设置全局配置

```shell
git config --global user.name "your name"
git config --global user.email "your email"
```

### 初始化项目

```shell
cd d:/var/www/php              //首先指定到你的项目目录下
git init
touch README.md
git add README.md
git commit -m "first commit"
// 用你仓库的url,vscode.git中vscode为仓库名称,使用时必须先创建
git remote add origin https://github.com/youtname/vscode.git
// 提交到你的仓库
git push -u origin master
```

### 记住密码

```shell
git config --global credential.helper store   //在Git Bash输入这个命令就可以了
```

### VSCode 使用 Git

- 修改文件

![img](https://upload-images.jianshu.io/upload_images/12122594-e4206dd7d6b73d8a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/464)

- 切换到 git 标签

![](https://upload-images.jianshu.io/upload_images/12122594-349ebdd6bf782e30.png?imageMogr2/auto-orient/)

- 暂存更改

![img](https://upload-images.jianshu.io/upload_images/12122594-c555f2d94ba1f5a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/318)

- 提交更改

![img](https://upload-images.jianshu.io/upload_images/12122594-32262f2b41c4a5b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/327)

- 推送更改

![img](https://upload-images.jianshu.io/upload_images/12122594-a948b8174e9b7b74.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/315)
