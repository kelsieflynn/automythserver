#!/bin/bash
#Script supports all 2 and 4 tuner OTA versions, ONLY US ATSC 1.0 tested
if [ $USER == 'mythtv' ] && [ $UID -ne '0' ] && [ -e ~/STAGE1.INSTALLED ];then
#VALIDPUBLICIPS=`ifconfig |grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"|sed '/255/d' |sed '/127/d'`
#printf "Valid Public IPs:\\n$VALIDPUBLICIPS \\n"
#aPUBLICDEVS=( `ls /sys/class/net/ |sed '/lo/d' |sed '/v/d'|tr [:space:] " "` )
#printf "${aPUBLICDEVS[*]} \\n"
#CPUBLICDEVS=`for i in ${aPUBLICDEVS[*]};do ifconfig $i;done`
#printf "$CPUBLICDEVS \\n"
#for i in {1..90};do echo $i;sleep 1;done|zenity --progress --auto-close --time-remaining --title="Automyth Stage2 Installer Pause: No DefaultIP" --window-icon=/usr/share/icons/Adwaita/96x96/places/network-workgroup-symbolic.symbolic.png --text='\n\nINSTALLER TIMEOUT: NetworkManager could not find a default IP4 IP, please resolve\n\n\nAfter ~ 90 seconds, installer will continue.'
#nm managed ver
#DEFAULTIP=`nmcli |grep inet4|awk '{print $2}'|head -n1|cut -d/ -f1`
DEFAULTIP=` nmcli -g ip4.address device show bond0|cut -d/ -f1`
if [ -z $DEFAULTIP ];then
	zenity --ellipsize --question  --icon-name=hdhr.png --text='<b>STUB: NOT YET AVAILABLE:DEVELOPMENT_FUTURE_OPTION</b>_Since you dont have a default ip on this computer, would you like to connect your hdhr device directly to its ethernet port and use it this way?See Image at left.\n\nYou can still connect to it remotely with wireless.\n If you choose "Yes" Automyth will setup this system as follows:\n
\tRemvove ethernet bondying and convert to single eth0\n
\tCreate a network 192.168.251.0 on default network device0\n
\tCreate bridge0 for wireless on default network device0\n
\tCreate static ip 192.168.251.1 for br0/wireless ifcfg-XXXX\n
\tSet MythBackend ServerIP to 192.168.251.1\n
\tSetup/start dhcpd server with range:\n
  \t192.168.251.11-192.168.251.253\n
	\t#reserve 8 IPs for hdhrs\
	in range 192.168.251.2-192.168.251.10\n
\tStart hostapd "wireless access point service"\n
\tNote: You have to start and or enable ssh manually,\n
\tafter you change the mythtv account password.\n\n\n\t
If you choose "No" the installer will continue to try to finish install\n
<b><i>Dont choose "No" until you have a IP, or 90 second timeout will be enabled.</i></b>\n'
fi
sleep 3

export DEFAULTIP=` nmcli -g ip4.address device show bond0|cut -d/ -f1`
if [ -z $DEFAULTIP ];then
	for i in {1..90};do echo $i;sleep 1;done|zenity --progress --auto-close --time-remaining --title="Automyth Stage2 Installer Pause: No DefaultIP" --window-icon=/usr/share/icons/Adwaita/96x96/places/network-workgroup-symbolic.symbolic.png --text='\n\nINSTALLER TIMEOUT: NetworkManager could not find a default IP4 IP, please resolve\n\n\nAfter ~ 90 seconds, installer will continue.'
fi




TOPCMD=`hdhomerun_config discover`
if [ "$TOPCMD" != "no devices found" ] ;then
zenity --info --ellipsize --timeout 2 --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Stage 2 HDHR Device Scan" --text='STAGE2: Starting Tuner and Stream Status Detection on up to 8 HDHR Devices.'

cmd="hdhomerun_config"
hwmcmd="get /sys/hwmodel"
modlcmd="get /sys/model"
vercmd="get /sys/version"

#
aHDHR=( `$cmd discover|sort -n|awk '{print $3}'` )
aHDHRIP=( `$cmd discover|sort -n|awk '{print $6}'` )
aHDHRHWM=( `$cmd "${aHDHR[*]}" $hwmcmd` )
aHDHRMODEL=( `$cmd "${aHDHR[*]}" $hwmcmd` )
aHDHRVER=( `$cmd "${aHDHR[*]}" $vercmd` )
aHDHRIGNORE=( HDCC-US HDCC2-2US HDCC3-2US HDCC4-US )
echo "We ignore "${aHDHRIGNORE[@]}" since they dont do OTA or are Untested "
#FIXME add blue single tuner to ignore or include in 1 UNIT STANZA's
#FIXME2 add options to ignore rack/tech units or finish includes in 1 UNIT STANZA's
#4 tuner model Oct/2017
QHDHRHWMODEL="HDHR5-4US"
#6 tuner rack model
#RACK8HDHRHWMODEL=
#8 tuner rack model
#RACK8HDHRHWMODEL=

nHDHR=`hdhomerun_config discover|sort -n|awk '{print $3}'|wc -l`


printf \\n"'$nHDHR' Total HDHR Units discovered, querying which Units to use based on units tuner status/streaminfo"\\n
printf \\n"Units which show populated "status/streaminfo" for any tuner, will cause complete Unit to be skipped"\\n
printf \\n"In the future we plan to re-design it to allow optional input at HDHR scan time"\\n

SQLDIR="/usr/share/doc/automythsvr-eit-stages/"

#16 template functions for 8 UNITS/(with up to 4 Tuners internally per unit)

#todo add 1_tuner_hdhrX_templates/fn

display_capturecard_tbl()
{
                        		printf "Displaying completed Templates from mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select cardid,videodevice,cardtype,defaultinput,hostname,dvb_eitscan,dishnet_eit,inputname,sourceid,tunechan,startchan,schedorder,livetvorder from capturecard;"
}

reorder_capturecard_tbl()
{
                        		printf "ReOrdering Capturecard Table "\\n
					for i in {1..16};do mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "update capturecard set schedorder=$i, livetvorder=$i where cardid=$i;";done
}

#PROTOTYPE HERE FIRST THEN GO LIVE
use_4tuner_hdhr1_template()
{
			HDHR1nTUNERS='4'
			echo "$HDHR1IP $HDHR1HWMODEL $HDHR1MODEL $HDHR1VER $HDHR1nTUNERS-Tuners $HDHR1"
				if [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR1, HDHR1 is $HDHR1."\\n
                        		printf "All 4 Tuners on $HDHR1 Free and Available for Use."\\n
					printf " TODO:Checking mythconverg.capturecard for existing $HDHR1"\\n
					#fn if !match then do
						printf " Templating mythconverg.capturecard for  $HDHR1"\\n
                        			cp -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR1.sql 2> /dev/null
							if [ $? -eq 0 ];then
								printf "Updating $HDHR1 4TUNER Template"\\n
                        					sed -i 's/FFFFFFFF/'$HDHR1'/' ~/stage2-capturecard-4TUNERS-$HDHR1.sql
                        					printf "Inserting completed $HDHR1 Templates in mythconvergdb"\\n
                        					mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR1.sql 2> /dev/null
									if [ $? -eq 0 ];then	
										exit 0
									else
										printf "Error returned last command. Exit 1"
										exit 1
									fi							
							else	
								printf "Error returned last command '$0'. Exit 1"
								exit 1
							fi
					display_capturecard_tbl
					reorder_capturecard_tbl 2> /dev/null
						if [ $? -eq 0 ];then
							printf "Displaying Final $HDHR1 Templates from mythconvergdb"\\n
							display_capturecard_tbl
                        				printf "Using ./STAGE2.HDHR1.READY as Marker of Sub-Script Completion"\\n
                        				touch ~/STAGE2.HDHR1.READY ~/STAGE2.READY
						else
							printf "Error returned last command. Exit 1"
							exit 1
						fi		
				else
                        		printf "*Device $HDHR1 with IP $HDHR1IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

		

use_2tuner_hdhr1_template()
	
{
			HDHR1nTUNERS='2'
			echo "$HDHR1IP $HDHR1HWMODEL $HDHR1MODEL $HDHR1VER $HDHR1nTUNERS-Tuners $HDHR1"
				if [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR1 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR1, HDHR1 is $HDHR1."\\n
                        		printf "Both Tuners on $HDHR1 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR1"\\n
                        		cp   -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR1.sql
                        		printf "Updating $HDHR1 Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR1'/' ~/stage2-capturecard-2TUNERS-$HDHR1.sql
                        		printf "Inserting completed $HDHR1 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR1.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR1 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ./STAGE2.HDHR1.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR1.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR1 with IP $HDHR1IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}



use_4tuner_hdhr2_template()
{
			HDHR2nTUNERS='4'
			echo "$HDHR2IP $HDHR2HWMODEL $HDHR2MODEL $HDHR2VER $HDHR2nTUNERS-Tuners $HDHR2"
	   	  		if [ `/usr/bin/hdhomerun_config $HDHR2 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR2 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR2, HDHR2 is $HDHR2."\\n
                        		printf "All 4 Tuners on $HDHR2 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR2"\\n
                        		cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR2.sql
                        		printf "Updating $HDHR2 4TUNER Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR2'/' ~/stage2-capturecard-4TUNERS-$HDHR2.sql
                        		printf "Inserting completed $HDHR2 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR2.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR2 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR2.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR2.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR2 with IP $HDHR2IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}
		

use_2tuner_hdhr2_template()
{
			HDHR2nTUNERS='2'
			echo "$HDHR2IP $HDHR2HWMODEL $HDHR2MODEL $HDHR2VER $HDHR2nTUNERS-Tuners $HDHR2"
		  		if [ `/usr/bin/hdhomerun_config $HDHR2 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR2 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR2, HDHR2 is $HDHR2."\\n
                        		printf "Both Tuners on $HDHR2 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR2"\\n
                       			cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR2.sql
                        		printf "Updating $HDHR2 Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR2'/' ~/stage2-capturecard-2TUNERS-$HDHR2.sql
                        		printf "Inserting completed $HDHR2 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR2.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR2 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR2.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR2.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR2 with IP $HDHR2IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}



use_4tuner_hdhr3_template()
	
{
			HDHR3nTUNERS='4'
			echo "$HDHR3IP $HDHR3HWMODEL $HDHR3MODEL $HDHR3VER $HDHR3nTUNERS-Tuners $HDHR3"
				if [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR3, HDHR3 is $HDHR3."\\n
                        		printf "All 4 Tuners on $HDHR3 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR3"\\n
                        		cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR3.sql
                        		printf "Updating $HDHR3 4TUNER Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR3'/' ~/stage2-capturecard-4TUNERS-$HDHR3.sql
                        		printf "Inserting completed $HDHR3 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR3.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR3 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR3.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR3.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR3 with IP $HDHR3IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}
		

use_2tuner_hdhr3_template()
{
			HDHR3nTUNERS='2'
			echo "$HDHR3IP $HDHR3HWMODEL $HDHR3MODEL $HDHR3VER $HDHR3nTUNERS-Tuners $HDHR3"
				if [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR3 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR3, HDHR3 is $HDHR3."\\n
                        		printf "Both Tuners on $HDHR3 Free and Available for Use, Templating mythconverg.capturecard for $HDHR3:"\\n
                        		cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR3.sql
                        		printf "Updating $HDHR3 Template:"\\n\\n
                        		sed -i 's/FFFFFFFF/'$HDHR3'/' ~/stage2-capturecard-2TUNERS-$HDHR3.sql
                        		printf "Inserting completed $HDHR3 Templates in mythconvergdb."\\n\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR3.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR3 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf \\n\\n\\n"Using ~/STAGE2.HDHR3.READY as Marker of Sub-Script Completion."\\n
                        		touch ~/STAGE2.HDHR3.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR3 with IP $HDHR3IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}



use_4tuner_hdhr4_template()
{
			HDHR4nTUNERS='4'
			echo "$HDHR4IP $HDHR4HWMODEL $HDHR4MODEL $HDHR4VER $HDHR4nTUNERS-Tuners $HDHR4"
				if [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR4, HDHR4 is $HDHR4."\\n
                        		printf "All 4 Tuners on $HDHR4 Free and Available for Use, Templating mythconverg.capturecard for $HDHR4"\\n
                       			cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR4.sql
                        		printf "Updating $HDHR4 4TUNER Template:"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR4'/' ~/stage2-capturecard-4TUNERS-$HDHR4.sql
                       			printf "Inserting completed $HDHR4 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR4.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR4 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR4.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR4.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR4 with IP $HDHR4IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}
		

use_2tuner_hdhr4_template()
{
			HDHR4nTUNERS='2'
			echo "$HDHR4IP $HDHR4HWMODEL $HDHR4MODEL $HDHR4VER $HDHR4nTUNERS-Tuners $HDHR4"
				if [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR4 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR4, HDHR4 is $HDHR4."\\n
                        		printf "Both Tuners on $HDHR4 Free and Available for Use, Templating mythconverg.capturecard for $HDHR4:"\\n
                        		cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR4.sql
                        		printf "Updating $HDHR4 Template:"\\n\\n
                        		sed -i 's/FFFFFFFF/'$HDHR4'/' ~/stage2-capturecard-2TUNERS-$HDHR4.sql
                        		printf "Inserting completed $HDHR4 Templates in mythconvergdb."\\n\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR4.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR4 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf \\n\\n\\n"Using ~/STAGE2.HDHR3.READY as Marker of Sub-Script Completion."\\n
                        		touch ~/STAGE2.HDHR4.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR4 with IP $HDHR4IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}


use_4tuner_hdhr5_template()
{
			HDHR5nTUNERS='4'
			echo "$HDHR5IP $HDHR5HWMODEL $HDHR5MODEL $HDHR5VER $HDHR5nTUNERS-Tuners $HDHR5"
				if [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR5, HDHR5 is $HDHR5."\\n
                        		printf "All 4 Tuners on $HDHR5 Free and Available for Use, Templating mythconverg.capturecard for $HDHR5"\\n
                       			cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR5.sql
                        		printf "Updating $HDHR5 4TUNER Template:"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR5'/' ~/stage2-capturecard-4TUNERS-$HDHR5.sql
                       			printf "Inserting completed $HDHR5 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR5.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR5 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR5.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR5.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR5 with IP $HDHR5IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

use_2tuner_hdhr5_template()
{
			HDHR5nTUNERS='2'
			echo "$HDHR5IP $HDHR5HWMODEL $HDHR5MODEL $HDHR5VER $HDHR5nTUNERS-Tuners $HDHR5"
				if [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR5 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR5, HDHR5 is $HDHR5."\\n
                        		printf "Both Tuners on $HDHR5 Free and Available for Use, Templating mythconverg.capturecard for $HDHR5:"\\n
                        		cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR5.sql
                        		printf "Updating $HDHR5 Template:"\\n\\n
                        		sed -i 's/FFFFFFFF/'$HDHR5'/' ~/stage2-capturecard-2TUNERS-$HDHR5.sql
                        		printf "Inserting completed $HDHR5 Templates in mythconvergdb."\\n\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR5.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR5 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf \\n\\n\\n"Using ~/STAGE2.HDHR5.READY as Marker of Sub-Script Completion."\\n
                        		touch ~/STAGE2.HDHR5.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR5 with IP $HDHR5IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}


use_4tuner_hdhr6_template()
{
			HDHR6nTUNERS='4'
			echo "$HDHR6IP $HDHR6HWMODEL $HDHR6MODEL $HDHR6VER $HDHR6nTUNERS-Tuners $HDHR6"
				if [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR6, HDHR6 is $HDHR6."\\n
                        		printf "All 4 Tuners on $HDHR6 Free and Available for Use, Templating mythconverg.capturecard for $HDHR6"\\n
                       			cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR6.sql
                        		printf "Updating $HDHR6 4TUNER Template:"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR6'/' ~/stage2-capturecard-4TUNERS-$HDHR6.sql
                       			printf "Inserting completed $HDHR6 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR6.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR6 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR6.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR6.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR6 with IP $HDHR6IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

use_2tuner_hdhr6_template()
{
			HDHR6nTUNERS='2'
			echo "$HDHR6IP $HDHR6HWMODEL $HDHR6MODEL $HDHR6VER $HDHR6nTUNERS-Tuners $HDHR6"
				if [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR6 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR6, HDHR6 is $HDHR6."\\n
                        		printf "Both Tuners on $HDHR6 Free and Available for Use, Templating mythconverg.capturecard for $HDHR6:"\\n
                        		cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR6.sql
                        		printf "Updating $HDHR6 Template:"\\n\\n
                        		sed -i 's/FFFFFFFF/'$HDHR6'/' ~/stage2-capturecard-2TUNERS-$HDHR6.sql
                        		printf "Inserting completed $HDHR6 Templates in mythconvergdb."\\n\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR6.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR6 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf \\n\\n\\n"Using ~/STAGE2.HDHR6.READY as Marker of Sub-Script Completion."\\n
                        		touch ~/STAGE2.HDHR6.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR6 with IP $HDHR6IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

use_4tuner_hdhr7_template()
{
			HDHR7nTUNERS='4'
			echo "$HDHR7IP $HDHR7HWMODEL $HDHR7MODEL $HDHR7VER $HDHR7nTUNERS-Tuners $HDHR7"
				if [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR7, HDHR7 is $HDHR7."\\n
                        		printf "All 4 Tuners on $HDHR7 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR7"\\n
                        		cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR7.sql
                        		printf "Updating $HDHR7 4TUNER Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR7'/' ~/stage2-capturecard-4TUNERS-$HDHR7.sql
                        		printf "Inserting completed $HDHR7 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR7.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR7 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR7.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR7.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR7 with IP $HDHR7IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

use_2tuner_hdhr7_template()
{
			HDHR7nTUNERS='2'
			echo "$HDHR7IP $HDHR7HWMODEL $HDHR7MODEL $HDHR7VER $HDHR7nTUNERS-Tuners $HDHR7"
				if [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR7 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR7, HDHR7 is $HDHR7."\\n
                        		printf "Both Tuners on $HDHR7 Free and Available for Use, Templating mythconverg.capturecard for  $HDHR7"\\n
                        		cp   -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR7.sql
                        		printf "Updating $HDHR7 Template"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR7'/' ~/stage2-capturecard-2TUNERS-$HDHR7.sql
                        		printf "Inserting completed $HDHR7 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR7.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR7 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ./STAGE2.HDHR7.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR7.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR7 with IP $HDHR7IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}


use_4tuner_hdhr8_template()
{
			HDHR8nTUNERS='4'
			echo "$HDHR8IP $HDHR8HWMODEL $HDHR8MODEL $HDHR8VER $HDHR8nTUNERS-Tuners $HDHR8"
				if [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner2/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner3/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR8, HDHR8 is $HDHR8."\\n
                        		printf "All 4 Tuners on $HDHR8 Free and Available for Use, Templating mythconverg.capturecard for $HDHR8"\\n
                       			cp   -avf $SQLDIR/stage2-capturecard-4TUNERS-FFFFFFFF.sql ~/stage2-capturecard-4TUNERS-$HDHR8.sql
                        		printf "Updating $HDHR8 4TUNER Template:"\\n
                        		sed -i 's/FFFFFFFF/'$HDHR8'/' ~/stage2-capturecard-4TUNERS-$HDHR8.sql
                       			printf "Inserting completed $HDHR8 Templates in mythconvergdb"\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-4TUNERS-$HDHR8.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR8 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf "Using ~/STAGE2.HDHR8.READY as Marker of Sub-Script Completion"\\n
                        		touch ~/STAGE2.HDHR8.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR8 with IP $HDHR8IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}

use_2tuner_hdhr8_template()
{
	HDHR8nTUNERS='2'
			echo "$HDHR8IP $HDHR8HWMODEL $HDHR8MODEL $HDHR8VER $HDHR8nTUNERS-Tuners $HDHR8"
				if [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner0/streaminfo|head -n1|awk '{print $1}'` == 'none' ] && [ `/usr/bin/hdhomerun_config $HDHR8 get /tuner1/streaminfo|head -n1|awk '{print $1}'` == 'none' ];then
                        		printf \\t\\t\\n"Working on  $HDHR3, HDHR3 is $HDHR3."\\n
                        		printf "Both Tuners on $HDHR3 Free and Available for Use, Templating mythconverg.capturecard for $HDHR3:"\\n
                        		cp  -avf $SQLDIR/stage2-capturecard-2TUNERS-FFFFFFFF.sql ~/stage2-capturecard-2TUNERS-$HDHR8.sql
                        		printf "Updating $HDHR3 Template:"\\n\\n
                        		sed -i 's/FFFFFFFF/'$HDHR8'/' ~/stage2-capturecard-2TUNERS-$HDHR8.sql
                        		printf "Inserting completed $HDHR8 Templates in mythconvergdb."\\n\\n
                        		mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg < ~/stage2-capturecard-2TUNERS-$HDHR8.sql
					display_capturecard_tbl
					reorder_capturecard_tbl
                        		printf "Displaying Final $HDHR8 Templates from mythconvergdb"\\n
					display_capturecard_tbl
                        		printf \\n\\n\\n"Using ~/STAGE2.HDHR8.READY as Marker of Sub-Script Completion."\\n
                        		touch ~/STAGE2.HDHR3.READY ~/STAGE2.READY
				else
                        		printf "*Device $HDHR8 with IP $HDHR8IP Will be skipped as one or more of its tuners are in use.\\n Re-plug your device and try again or \\nClear tuner(s) channel to "0" in hdhrhomerun_config_gui "\\n
				fi
				printf "\\n"
}



zinfo_hdhrscan()
{
zenity --info --ellipsize --timeout 3 --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Stage 2 HDHR Device Scan" --text='\nFound "'$nHDHR'" HDHR Device(s).\nDetermining Which Device(s) AutoMythSvr will use.'
}


fnhdhr1()
{
	HDHR1="${aHDHR[0]}"
	HDHR1IP="${aHDHRIP[0]}"
	HDHR1HWMODEL=`$cmd $HDHR1 $hwmcmd`
	HDHR1MODEL=`$cmd $HDHR1 $modlcmd`
	HDHR1VER=`$cmd $HDHR1 $vercmd`
	#NEED another level of check here before evaluation of ==
	if [ $HDHR1HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr1_template
	else 
		use_2tuner_hdhr1_template
	fi
}


fnhdhr2()
{
	HDHR2="${aHDHR[1]}"
	HDHR2IP="${aHDHRIP[1]}"
	HDHR2HWMODEL=`$cmd $HDHR2 $hwmcmd`
	HDHR2MODEL=`$cmd $HDHR2 $modlcmd`
	HDHR2VER=`$cmd $HDHR2 $vercmd`
	if [ $HDHR2HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr2_template
	else 
		use_2tuner_hdhr2_template
	fi
}


fnhdhr3()
{
	HDHR3="${aHDHR[2]}"
	HDHR3IP="${aHDHRIP[2]}"
	HDHR3HWMODEL=`$cmd $HDHR3 $hwmcmd`
	HDHR3MODEL=`$cmd $HDHR3 $modlcmd`
	HDHR3VER=`$cmd $HDHR3 $vercmd`
	if [ $HDHR3HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr3_template
	else 
		use_2tuner_hdhr3_template
	fi
}

fnhdhr4()
{
	HDHR4="${aHDHR[3]}"
	HDHR4IP="${aHDHRIP[3]}"
	HDHR4HWMODEL=`$cmd $HDHR4 $hwmcmd`
	HDHR4MODEL=`$cmd $HDHR4 $modlcmd`
	HDHR4VER=`$cmd $HDHR4 $vercmd`
	if [ $HDHR4HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr4_template
	else 
		use_2tuner_hdhr4_template
	fi
}



fnhdhr5()
{
	HDHR5="${aHDHR[4]}"
	HDHR5IP="${aHDHRIP[4]}"
	HDHR5HWMODEL=`$cmd $HDHR5 $hwmcmd`
	HDHR5MODEL=`$cmd $HDHR5 $modlcmd`
	HDHR5VER=`$cmd $HDHR5 $vercmd`
	#NEED another level of check here before evaluation of ==
	if [ $HDHR5HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr5_template
	else 
		use_2tuner_hdhr5_template
	fi
}


fnhdhr6()
{
	HDHR6="${aHDHR[5]}"
	HDHR6IP="${aHDHRIP[5]}"
	HDHR6HWMODEL=`$cmd $HDHR6 $hwmcmd`
	HDHR6MODEL=`$cmd $HDHR6 $modlcmd`
	HDHR6VER=`$cmd $HDHR6 $vercmd`
	if [ $HDHR6HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr6_template
	else 
		use_2tuner_hdhr6_template
	fi
}


fnhdhr7()
{
	HDHR7="${aHDHR[6]}"
	HDHR7IP="${aHDHRIP[6]}"
	HDHR7HWMODEL=`$cmd $HDHR7 $hwmcmd`
	HDHR7MODEL=`$cmd $HDHR7 $modlcmd`
	HDHR7VER=`$cmd $HDHR7 $vercmd`
	if [ $HDHR7HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr7_template
	else 
		use_2tuner_hdhr7_template
	fi
}

fnhdhr8()
{
	HDHR8="${aHDHR[7]}"
	HDHR8IP="${aHDHRIP[7]}"
	HDHR8HWMODEL=`$cmd $HDHR8 $hwmcmd`
	HDHR8MODEL=`$cmd $HDHR8 $modlcmd`
	HDHR8VER=`$cmd $HDHR8 $vercmd`
	if [ $HDHR8HWMODEL == $QHDHRHWMODEL ];then
		use_4tuner_hdhr8_template
	else 
		use_2tuner_hdhr8_template
	fi
}



#if_0_HDHR_UNITS_FOUND
if [ $nHDHR -eq 0 ];then
       	printf "No HDHR Units found."\\n
        zenity --ellipsize --error  --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Error" --text='<b>STAGE2 INSTALLER LATE FAILURE</b>.\n\n No HDHR Devices Found\nYet somehow script made it this far...'
	exit 1
fi


#if_1_HDHR_UNIT_FOUND
#
printf "\\n"
if [ $nHDHR -eq 1 ];then
	zinfo_hdhrscan
	fnhdhr1
fi

#if_2_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 2 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
fi

#if_3_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 3 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
fi

#if_4_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 4 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
	sleep 2
	fnhdhr4
fi

#if_5_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 5 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
	sleep 2
	fnhdhr4
	sleep 2
	fnhdhr5
fi


#if_6_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 6 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
	sleep 2
	fnhdhr4
	sleep 2
	fnhdhr5
	sleep 2
	fnhdhr6
fi



#if_7_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 7 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
	sleep 2
	fnhdhr4
	sleep 2
	fnhdhr5
	sleep 2
	fnhdhr6
	sleep 2
	fnhdhr7
fi


#if_8_HDHR_UNITS_FOUND
#
printf "\\n"
if [ $nHDHR -eq 8 ];then
	zinfo_hdhrscan
	fnhdhr1
	sleep 2
	fnhdhr2
	sleep 2
	fnhdhr3
	sleep 2
	fnhdhr4
	sleep 2
	fnhdhr5
	sleep 2
	fnhdhr6
	sleep 2
	fnhdhr7
	sleep 2
	fnhdhr8
fi

#if_>8_HDHR_UNITS_FOUND

printf "\\n"
if [ $nHDHR -gt 8 ];then
       	printf "ERROR: No More than 8 HDHR Units (Max) are supported by the installer at this time. Can't process more than 8, Exiting."\\n
	exit 1
fi

#if hdhr units found but all tuners busy and no STAGE2.READY stamp
while [ $nHDHR -gt 0 ] &&  [ ! -e ~/STAGE2.READY ];do
       	printf "No Tuners HDHR available, Prompting for re-run"\\n
	zenity --ellipsize --question --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --text='<b>\t\t\t\t\t\tAll HDHR Unit(s) in Use?\n\nAny tuner in use on a HDHR Unit will cause the whole Unit be skipped completely by the installer.\n\t\t<i>To override device(s) that show busy, but not yet used in another system;\n\t\t\tSet <b>"ALL" its tuner(s) channel to 0 </b>in HDHomeRun Config.\n\n\t\tThe same method can be used to block or reserve a device from the installer from using it.\n\t\t\tIn that case, set a channel on at least one tuner on each unit you would like to skip.\n\t\t\t Rescan/reconfigure again as many times as needed.</i>\n\n\nChoose "Yes" to run HDHomeRun Config or Choose "No" to exit installer.\n\t*<i> You can restart this stage anytime after you exit with cmd:\n\t\tsudo systemctl start automythsvr-eit-stage2.install</i></b>'
	if [ $? -eq 1 ];then
		printf \\n"Cleaning up prev STAGE2*.READY stamps and tmp stage2-capturecard*.sql templates"\\n
		rm -rfv /home/mythtv/STAGE2*.READY /home/mythtv/stage2-capturecard-*.sql
		printf \\n"Exiting after, Manual exit option "No" choosen."\\n
	   	exit 1
	else
		printf \\n"Dialog option "Yes" selected, Opening HDHomeRun Config."\\n
		#clean up a existing procs if any, so script doesnt go weird and trap another running proc
		#fixme: fix this by pulling the PID of the one we start, make that pid the only valid one for each script run, then killing the uniq pid.
		pkill -f hdhomerunconfig_gui
		sleep 1
		hdhomerun_config_gui 
		printf \\n"Dialog option "Yes" selected , re-starting stage2 install"\\n
		#set a trap here to check ethernet line speed , and question user for confirmation.  Some detailed filters will be needed. eg. if #nHDHRs >X and $total tuners > Y, then ask for confirmation in scenarios.
		if [ $nHDHR -eq 1 ];then
			fnhdhr1
		
		elif [ $nHDHR -eq 2 ];then
			fnhdhr1
			fnhdhr2
		elif [ $nHDHR -eq 3 ];then
			fnhdhr1
			fnhdhr2
			fnhdhr3
		elif [ $nHDHR -eq 4 ];then
			fnhdhr1
			fnhdhr2
			fnhdhr3
			fnhdhr4
		elif [ $nHDHR -eq 5 ];then
			fnhdhr1
			fnhdhr2
			fnhdhr3
			fnhdhr4
			fnhdhr5
		elif [ $nHDHR -eq 6 ];then
			fnhdhr1
			fnhdhr2
			fnhdhr3
			fnhdhr4
			fnhdhr5
			fnhdhr6
		elif [ $nHDHR -eq 7 ];then
			fnhdhr1
			fnhdhr2
			fnhdhr3
			fnhdhr4
			fnhdhr5
			fnhdhr6
			fnhdhr7
		else 
			fnhdhr1
			fnhdhr2
			fnhdhr3
			fnhdhr4
			fnhdhr5
			fnhdhr6
			fnhdhr7
			fnhdhr8
		fi
	   	#exit 0
	fi
done

#if units found and imported
if [ $nHDHR -gt 0 ] &&  [ -e ~/STAGE2.READY ];then
	ADDEDHDHRs=`ls ~/stage2-capturecard-*TUNER*-*.sql|cut -d. -f1|cut -d- -f4`
       	printf "Using HDHR UNITS: \\n$ADDEDHDHRs"\\n
       	printf "Stage 2 Complete. Exiting normally."\\n
	zenity --info --ellipsize --timeout 3 --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Stage 2 HDHR Device Scan Finish" --text='\nUsing HDHR UNIT(s):\n\n\t'$ADDEDHDHRs' '
	printf \\n"Disabling stage2 install service after Stage2 Finished Without error."\\n
	sudo systemctl --no-reload disable automythsvr-eit-stage2.install.service 2> /dev/null || :
	printf "Displaying 'mythconverg.capturecard' data"\\n
	mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select cardid,videodevice,cardtype,defaultinput,hostname,dvb_eitscan,dishnet_eit,inputname,sourceid,tunechan,startchan,schedorder,livetvorder from capturecard;"
else 
	
       	printf "Unknown error processing HDHR Units."\\n

fi




else
        zenity --ellipsize --error  --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Error" --text='<b>STAGE2 INSTALLER PreCheck FAILURE</b>.\n\n No Tuner Devices Found.'
	printf "***##################***ERROR NO HDHR DEVICES OR DVB DEVICES FOUND***#################################***\n"
	exit 1
fi




###PreCheckFailures
else
        zenity --ellipsize --error  --window-icon=/usr/share/icons/hicolor/32x32/hdhr.png --title="Error" --text='\t\t\t\t<b>STAGE2 INSTALLER PreCheck FAILURE</b>.\n\n Stage1 Completion Marker Not present or user attempting  run this installer as <b>NON-</b> <i>mythtv</i> user.'
        echo "script FAILURE: STAGE2,precheck failure." 
        exit 1
fi

