# kernel

## kernel upgrade

升级内核
```bash
su - root
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
# 为你的系统添加库
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
# 安装 kernel-ml 包
yum --enablerepo=elrepo-kernel install kernel-ml
# 重启
reboot
```

卸载
```bash
yum remove kernel-ml
```