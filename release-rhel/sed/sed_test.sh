#!/bin/bash

# modify profile
sed -i \
    -e '/# Include.*zabbix_agentd.conf.d\//aInclude=\/etc\/zabbix\/zabbix_agentd.conf.d\/\n' \
	-e '/$/PATH/&JAVA_HOME'
    -e 's|/usr/local|/usr|g' \
     profile
sed '/./{s/^/HEAD&/;s/$/&TAIL/}' test.file