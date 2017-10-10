#!/bin/bash

user=mysql
group=mysql
pwd_default=password
 
# create group if not exists
egrep "^$group" /etc/group >& /dev/null
if [ $? -ne 0 ] ; then
	groupadd $group ; echo "Create Group : $group"
fi

# drop user if exists
userdel -frZ $user ;

# create user if not exists
egrep "^$user" /etc/passwd >& /dev/null
if [ $? -ne 0 ] ; then
	useradd -g $group $user ; echo "`id $user`"
fi

# passwd user
echo "$pwd_default" | passwd --stdin $user
