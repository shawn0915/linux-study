# command

```bash
# apache性能测试工具ab
# yum install -y httpd-tools
ab

ac
ac -p

# 计算器
bc

# tar包文件路径
uz
uz redis-2.8.19.tar.gz | tee redis
```

- nohup

```bash
command
command > /dev/null
command > /dev/null 2>&1
command &
command > /dev/null &
command > /dev/null 2>&1 &
command &> /dev/null
nohup command &> /dev/null
```

- screen

```bash
yum install screen
```

创建独立的 screen 命令如下：
`screen -dmS elkscreen_1`

接管连入创建的 elkscreen_1 命令如下：
`screen -r elkscreen_1`

按 Ctrl+A+D 键，断开环境。

想重新接管，依然 screen -r elkscreen_1 即可。

如果创建了多个 screen，查看列表命令如下：
`screen -list`

- daemontools

supervisord