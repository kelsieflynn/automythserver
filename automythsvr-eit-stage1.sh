#!/bin/bash
SQLDIR="/usr/share/doc/automythsvr-eit-stages"
/usr/bin/hostnamectl set-hostname automythsvr-g36fe0ce 2>/dev/null
if [ $UID -ne 0 ] && [ $USER == 'mythtv' ] && [ ! -e ~/.automythtztables.completed ] && [ ! -e ~/STAGE1.INSTALLED ];then
		printf "Updating mysql database to timezone tables, 'mysql_tzinfo_to_sql' "\\n
		/usr/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo|mysql -uroot mysql 2> /dev/null
			if [ $? -eq 0 ];then
				echo "creating ~/.automythtztables.completed"
				touch ~/.automythtztables.completed 2> /dev/null
			else
				echo "exit code from attempted run ofmysql_tzinfo_to_sql, reports failure"
				exit 1
			fi
	
		if [ -e ~/.automythtztables.completed ] && [ ! -e ~/.automythmythtvacct.completed ] && [ ! -e ~/STAGE1.INSTALLED ] && [ -e $SQLDIR/automythsvr.mc.sql ];then
			printf "Importing automythsvr.mc.sql "\\n
			mysql -v -uroot <$SQLDIR/automythsvr.mc.sql 2> /dev/null
				if [ $? -eq 0 ];then
					echo "creating ~/.automythmythtvacct.completed"
					touch ~/.automythmythtvacct.completed 2> /dev/null
				else
					echo "exit code from attempted import of $SQLDIR/automythsvr.mc.sql, reports failure"
					exit 1
				fi
		fi

		#STUB
		#if [ ! -e ~/.stage1.sql.completed ] && [ -e ~/.automythmythtvacct.completed ] && [ ! -e ~/STAGE1.INSTALLED ] && [ -e $SQLDIR/automythsvr.stage1.sql ];then
		#      	zenity --ellipsize --timeout 30 --question  --icon-name=hdhr.png --text='<b>STUB:NOT YET AVAILABLE:DEVELOPMENT_FUTURE_OPTION</b>\n\nInstallType, what install type?:\n\t By default Automyth will install
		#mythtv in a more secure way, using a standalone/all-in-one setup with VPN access, this is the default option.\n This standalone/all in one mode is the most secure option since we only open VPN ports on the firewall by default.\n In this install mode all remote clients should connect over VPN, wireless can be used as well if the server is running hostapd.\n\n\n The other option is to use a dhcp server provided IP and a Static Hostname Automyth provides, this is the least secure option as it will open up more firewall ports to allow direct connections to mythbackend and mysql.\n You can still use the VPN in this mode to make it more secure.\n\tIf you would like to install mythtv in standalone/all-in-one(Client/Server classic mode) method, choose  Option "Yes" or choose "No" for the more secure option.\n \n\t Choosing "No" will use set automythsvr to standalone/all-in-one and remote VPN connections.\n\t<i>Note: After 90 seconds Installer will select "No" and continue with the default standalone/all-in-one install method .</i>\n\n<b>STUB.THIS IS ONLY A DEVSTUB FOR NOW. ALL INSTALLS ARE STANDALONE/AIO IN THIS RELEASE with remote access limited to VPN Clients Only.</b>'
		#fi
		#sub stub. If aio mode, and NO IP yet, but, ask if they want to connect their HDHR directly via crossover cable to the ethernet port on this unit, if found.
		#	if wlan0 exists with AP features, ask if they want to use this unit as a Wireless Access Point,
		#		if so ask if net A. 192.168.0 is okay to use
		#			else ask if B. 10.10.1.0  is okay to use 
		#				else ask if net C. XX.XX.XX.XXXX is okay to use
		#		  then install hostapd/dhcpd started on net A B or C
		#
		#		else if wlan0 exists withOUT AP features, warn they have wireless but no AP features, but ask if they want to start a Computer 2 Computer Hybrid Wireless connection.
		#		if so enable
		#	fi
		#STUB
		#if [ ! -e ~/.stage1.sql.completed ] && [ -e ~/.automythmythtvacct.completed ] && [ ! -e ~/STAGE1.INSTALLED ] && [ -e $SQLDIR/automythsvr.stage1.sql ];then
		#      	zenity --ellipsize --timeout 4 --question  --icon-name=hdhr.png --text='<b>NOT YET AVAILABLE:DEVELOPMENT_FUTURE_OPTION</b>\n\nConnectionType, what connection type:\n\t By default Automyth will use Antenna/OTA atsc-8vsb-us as its TV source.\n\tIf you would like to choose another Frequency Table such as QAM for Cable choose Option "Yes"\n \tthen Automyth will re-setup this system as slected.\n\t Choosing no will skip the delay and continue the installer.\n\t<i>After X Seconds Installer will select "No" and continue with Antenna/OTA atsc-8vsb-us.</i>'
		#fi
	

		if [ ! -e ~/.stage1.sql.completed ] && [ -e ~/.automythmythtvacct.completed ] && [ ! -e ~/STAGE1.INSTALLED ] && [ -e $SQLDIR/automythsvr.stage1.sql ];then
			printf \\n"Importing automythsvr-eit-stage1 into  mythconverg database"\\n
			mysql -D mythconverg -uroot <$SQLDIR/automythsvr.stage1.sql 2> /dev/null
				if [ $? -eq 0 ];then
					echo "creating  ~/.stage1.sql.completed"
					touch ~/.stage1.sql.completed 2> /dev/null
				else
					echo "exit code from attempted import of $SQLDIR/automythsvr.stage1.sql, reported failure"
					exit 1
				fi
		fi

		if [ -e ~/.stage1.sql.completed ] && [ ! -e ~/STAGE1.INSTALLED ];then
			printf "Cleaning up previous pre-stage1 Completion Markers"\\n
			rm -rfv ~/.automythsqladmin.completed
			rm -rfv ~/.automythtztables.completed
			rm -rfv ~/.automythmythtvacct.completed
			rm -rfv ~/.stage1.sql.completed
			#printf "updating tables to use $mHOST"\\n
			#mysql -D mythconverg -uroot -h $mHOST -e "update settings set hostname='$mHOST';" 2> /dev/null
			printf "Final stage1: testing table selection, prior to completion"\\n
				IP="127.0.0.1"
				TEST1=`/usr/bin/mysql -pmythtv -D mythconverg -e "select * from  settings where hostname='automythsvr-g36fe0ce' AND data='$IP' AND value=( 'BackendServerIP' AND 'MasterServerIP');"` 2> /dev/null
				if [ $? -eq 0 ];then
			                echo "Select Test1 passed , proceeding"
					printf "Creating ~/STAGE1.INSTALLED as Marker of Stage1 Script Completion"\\n
					touch  ~/STAGE1.INSTALLED
					printf "Disabling automythsvr-eit-stage1.install.service systemd service after completion"\\n
					sudo systemctl --no-reload disable automythsvr-eit-stage1.install.service 2> /dev/null || :
				else
					echo "exit code from test of db test selection reported ERROR';"
					#echo "exit code from 'update settings set hostname', reported failure"
					exit 1
				fi
		fi
else
	printf \\n\\n"Stage1 Script FAILURE: 2 probable reasons,  Non 'mythtv' user attempt or stale install files:"\\n
	printf  \\n\\n" Remove  ~/.automythtztables.completed and/or  ~/STAGE1.INSTALLED or run am_resetMythconverg.sh and restart"\\n
	exit 1
fi
