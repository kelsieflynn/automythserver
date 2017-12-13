#!/bin/bash
if [ `pgrep -x mythbackend` &>/dev/null 2>&1 ];then 
	echo mythbackend_running, stoping.
	sudo systemctl stop mythbackend 2> /dev/null
fi

if [ -e /home/mythtv/STAGE1.INSTALLED ];then 
	rm -rfv /home/mythtv/STAGE1.INSTALLED 
fi 

if [ -e /home/mythtv/STAGE3.INSTALLED ];then 
	rm -rfv /home/mythtv/STAGE3.INSTALLED 
fi 

if [ -e /home/mythtv/STAGE2.HDHR1.READY ];then
	 rm -rfv /home/mythtv/STAGE2.HDHR1.READY 
fi

if [ -e /home/mythtv/STAGE2.HDHR2.READY ];then
	 rm -rfv /home/mythtv/STAGE2.HDHR2.READY 
fi

if [ -e /home/mythtv/STAGE2.HDHR3.READY ];then
	 rm -rfv /home/mythtv/STAGE2.HDHR3.READY 
fi

if [ -e /home/mythtv/STAGE2.HDHR4.READY ];then
	 rm -rfv /home/mythtv/STAGE2.HDHR4.READY 
fi

if [ -e /home/mythtv/STAGE2.READY ];then
	 rm -rfv /home/mythtv/STAGE2.READY 
fi

if [ -e /home/mythtv/hdhomerun.devices.init ];then
	 rm -rfv /home/mythtv/hdhomerun.devices.init 
fi

if [ `pgrep -x mysqld` &>/dev/null 2>&1 ] || [ `pgrep -x mariadb` &>/dev/null 2>&1 ];then 
	if [ -e /var/lib/mysql/mythconverg ];then 
		echo "mythconverg exists, dropping and recreating empty db"
		mysql -v -h automythsvr-g36fe0ce -uroot -e "DROP DATABASE IF EXISTS mythconverg;" 2> /dev/null
		mysql -v -h automythsvr-g36fe0ce -uroot -e "create database mythconverg;" 2> /dev/null
		exit 0
	else 
		echo "no mythconverg found, creating empty db"
		mysql -v -h automythsvr-g36fe0ce -uroot -e "create database mythconverg;" 2> /dev/null
		exit 0
	fi
else
	echo "mysqld or mariadb is not running, can not reset mythconverg db"
fi
