# glibc

## 编译安装 glibc 2.14

```bash
tar zxvf glibc-2.14.tar.gz
cd glibc-2.14
mkdir build
cd build/
../configure --prefix=/opt/glibc-2.14
touch /opt/glibc-2.14/etc/ld.so.conf
make
make install
#
#cd /opt/glibc-2.14/lib
#ls libc-2.14.so
#
cp -r /etc/ld.so.c* /opt/glibc-2.14/etc/
ln -s /opt/glibc-2.14/lib/libc-2.14.so /lib64/libc.so.6
```

安装完成，可能提示缺少文件`touch /opt/glibc-2.14/etc/ld.so.conf`



## 查看系统glibc支持的版本
    
    strings /lib64/libc.so.6 | grep GLIBC


## ref

- [The GNU C Library (glibc)](http://www.gnu.org/software/libc/)
- [tarball via ftp](http://ftp.gnu.org/gnu/glibc/)

```html
http://www.linuxidc.com/Linux/2017-01/139833.htm
```