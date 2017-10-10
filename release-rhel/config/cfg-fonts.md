# 安装宋体字库（simsun.ttc）

需要在操作系统进行安装，安装顺序如下：

1.创建文件夹
```bash
cd /usr/share/fonts/
mkdir simsun
```

2.将字体库上传至该文件夹

3.安装字体库
```bash
cd simsun
mkfontscale
mkfontdir
fc-cache -fv
source /etc/profile
```

