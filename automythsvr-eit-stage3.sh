#!/bin/bash
printf \\t\\n\\n"AutoMythSVR STAGE3 Starting Initial prechecks on conditions."\\n\\n
if [ $USER == 'mythtv' ] && [ $UID -ne '0' ];then
	if [ -x /usr/bin/mythtv-setup ];then
		if [ ! -e ~/STAGE3.INSTALLED ];then
			if [ -e ~/STAGE2.READY ];then
				printf \\t\\n\\n"Starting Initial prechecks on HDHR Stage Completions."\\n\\n
				printf \\t\\n\\n"Setting up Default CardID for Channel Scanner"\\n\\n
				CARDID=`mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select cardid from capturecard;"|head -n2|tail -n1`
				printf \\t\\n\\n"Default CardID for Channel Scanner will be #$CARDID"\\n\\n
				printf \\t\\n\\n"Starting non-interactive mythtv Channel Scanner"\\n\\n
				/usr/bin/mythtv-setup --scan $CARDID --scan-non-interactive --service-type all 2> /dev/null
					if [ $? -eq 0 ];then
						printf \\t\\n\\n"Finding Default Start Channel for capturecards"\\n\\n
						STARTCH=`mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select channum from channel;"|sort -n|head -n2|tail -n1`
						printf \\t\\n\\n"Start channel to use will be $STARTCH"\\n
						printf \\t\\n\\n"Inserting Start Channel into capturecard for automythsvr-g36fe0ce"\\n 
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "update capturecard set startchan='$STARTCH' where hostname='automythsvr-g36fe0ce';"
						printf \\t\\n\\n"Showing start channel from automythsvr-g36fe0ce as select"\\n
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select cardid, startchan from capturecard;"
						printf \\t\\n\\n"Updating channel to useonairguide"\\n
						sleep 1
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "update channel set useonairguide='1';"
						printf \\t\\n\\n"Showing useonairguide setting from channels"\\n
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "select chanid,channum,useonairguide from channel;"
						sleep 2
						printf \\t\\n\\n"Starting Audio Configuation. "\\n
						#TESTED with SINGLE HDMI present ONLY, need to test 2
						AODEFAULT=NULL
						AOD=0
						if [ -e /proc/asound/HDMI ];then
                					if [ `cat "/proc/asound/card0/eld#0.0"|awk '{print $1}'|grep -x speakers` ];then
                        					printf "HDMI0DEV0 has speakers! This is our default\n"
                        					HDMI0DEV0="ALSA:hdmi:CARD=HDMI,DEV=0"
                        					AODEFAULT="$HDMI0DEV0"
                        					AOD="1"
                        					echo "$AODEFAULT"

                					elif [ `cat "/proc/asound/card0/eld#0.1"|awk '{print $1}'|grep -x speakers` ];then
                        					printf "HDMI0DEV1 has speakers! This is our default\n"
                        					HDMI0DEV1="ALSA:hdmi:CARD=HDMI,DEV=1"
                        					AODEFAULT="$HDMI0DEV1"
                        					AOD="1"
                        					echo "$AODEFAULT"

                					elif [ `cat "/proc/asound/card0/eld#0.2"|awk '{print $1}'|grep -x speakers` ];then
                        					HDMI0DEV2="ALSA:hdmi:CARD=HDMI,DEV=2"
                        					printf "HDMI0DEV2 has speakers! This is our default\n"
                        					AODEFAULT="$HDMI0DEV2"
                        					AOD="1"
                					else
                	        				printf "No HDMI speakers listed, But HDMI0DEV0 is our preferred 2nd default anyway\n"
                        					HDMI0DEV0="ALSA:hdmi:CARD=HDMI,DEV=0"
                       	 					AODEFAULT="$HDMI0DEV0"
                        					AOD="1"
                        					echo "$AODEFAULT"
                					fi

						elif [ -e /proc/asound/Intel ] && [ $AOD -ne 1 ];then
        					AODEFAULT="ALSA:default:CARD=Intel"
        					echo "$AODEFAULT"
        					AOD="1"
		
						elif [ -e /proc/asound/PCH ] && [ $AOD -ne 1 ];then
						# AODEFAULT="ALSA:default:`aplay -l|awk -F \: '/,/{print $2}'|awk '{print $1}'|grep -vx HDMI`"
        					AODEFAULT="ALSA:default:PCH"
        					echo "$AODEFAULT"
        					AOD="1"

						else
        					AODEFAULT="ALSA:default:CARD=Intel"
        					echo "$AODEFAULT"
        					AOD="1"
						fi

						printf \\t\\n\\n"Inserting audio information for Audio Output Device and Mixer for local Automythsvr frontend"\\n
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "insert into settings(value, data, hostname) VALUES('AudioOutputDevice', '$AODEFAULT', 'automythsvr-g36fe0ce');"
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "insert into settings(value, data, hostname) VALUES('MixerDevice', 'software', 'automythsvr-g36fe0ce');" 
		
						printf \\t\\t\\t\\n\\n"Setting Automythsvr local Default Theme to 'MythCenter-wide'"\\n
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "insert into settings(value, data, hostname) VALUES('Theme', 'MythCenter-wide', 'automythsvr-g36fe0ce');" 

						printf \\t\\t\\t\\n\\n"Setting Automythsvr local DefaultVideoPlaybackProfile to 'Slim'"\\n
						mysql -umythtv -pmythtv -h automythsvr-g36fe0ce -D mythconverg -e "insert into settings(value, data, hostname) VALUES('DefaultVideoPlaybackProfile', 'Slim', 'automythsvr-g36fe0ce');" 
		
						printf \\t\\t\\t\\n\\n"Optimizing DB"\\n
						mysqlcheck -h automythsvr-g36fe0ce -o -umythtv -pmythtv mythconverg	
						printf \\t\\t\\t\\n\\n"timezone check"\\n
						zenity --ellipsize --info --timeout 30 --title="Confirm Timezone Set/Unset Ntp Servers" --text='In the next dialog confirm/set your timezone/time\n and set or unset any ntp server options that apply.\n<i>*Note: After 30 seconds installer will close dialog \nand continue install with the current timezone:\n --utc America/New York.</i>'
						sudo timeout 30s system-config-date --foreground -k 30s -s9
						printf \\t\\t\\t\\n\\n"DB READY"\\n
						touch ~/STAGE3.INSTALLED
						printf \\n"Disabling autmythsvr-eit-stage3,install service."\n
                				sudo systemctl --no-reload disable automythsvr-eit-stage3.install.service 2> /dev/null || :
						sleep 2
						if [ ! -e /dev/mapper/live-rw ];then		
							sudo systemctl enable mythbackend.service||: 2> /dev/null
							sudo systemctl start mythbackend.service||: 2> /dev/null
							sudo systemctl enable mythfrontend.service||: 2> /dev/null
							zenity --info --ellipsize --timeout 20 --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Install Complete" --text='\n\Install Complete, Starting Mythfrontend Service\n'
							sudo systemctl start mythfrontend.service||: 2> /dev/null
							exit 0
						else
							zenity --info --ellipsize --timeout 10 --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="RUNNING non-persistent LIVESESSION! AutomythEit HDHR Installer Demonstration\!" --text='\n\nRUNNING non-persistent LIVESESSION! AutomythEit HDHR Installer Demonstration\n <b><i>Notice: Only briefly running mythbackend/mythfrontend while in live session.</i></b>\n To run/install in persistent mode, install the Operating System with "liveinst".\n"For BUG Reports: Create a summary text and send email to automythdevs@gmail.com"\n'
							sudo systemctl --no-reload disable mythbackend.service||: 2> /dev/null
							sudo systemctl --no-reload disable mythfrontend.service||: 2> /dev/null
							sudo systemctl stop mythbackend.service||: 2> /dev/null
							sudo systemctl stop mythfrontend.service||: 2> /dev/null
							/bin/timeout -k 92 -s15 90 /usr/bin/mythbackend -d --noupnp --syslog local7 --loglevel err > /dev/null
							/bin/timeout -k 67 -s15 65 /usr/bin/mythfrontend -nw -display :0 -d --noupnp --geometry 640x360+10+240 --jumppoint "Live TV" --syslog local7
							sleep 3
							pgrep -x mythbackend 2> /dev/null
								if [ $? -eq 0 ];then
									pkill -15 mythbackend 2> /dev/null
										if [ $? -eq 0 ];then
											pkill -9 mythbackend 2> /dev/null
										fi
								else
									echo "no mythbackend process found"
								fi
							sleep 2
							pgrep -x mythfrontend 2> /dev/null
								if [ $? -eq 0 ];then
									pkill -15 mythfrontend 2> /dev/null
										if [ $? -eq 0 ];then
											pkill -9 mythfrontend 2> /dev/null
										fi
								else
									echo "no mythfrontend process found"
								fi
							zenity --info --ellipsize --timeout 20 --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Live Demonstration Complete" --text='\n\nInstall with "sudo liveinst" or click on Menu>System>"Install to Hard Drive"\n"For BUG Reports: Create a summary text and send email to automythdevs@gmail.com"\n'
							exit 0
						fi
					
					else
						zenity --ellipsize --error  --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Error" --text='<b>\t\tStage3 Installer Failure!</b>\n\n\nmythtv-setup exited with error, exiting now.'
						printf "\nmythtv-setup exited with error code, exiting now.\n"
						exit 1
					fi

				else
					zenity --ellipsize --error  --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Error" --text='<b>\t\tStage3 Installer Failure!</b>\n\n\nPreCheck Condition Failure:\n\n\tDebug: STAGE2.READY Completion file not found.'
        				printf "\nStage3 Script FAILURE: ~/STAGE2.READY Completion file not found.\n" 
					exit 1
				fi


			else
				zenity --ellipsize --error --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Error" --text='<b>\t\tStage3 Installer Failure!</b>\n\n\nPreCheck Condition Failure:\n\n\tDebug: STAGE3.INSTALLED Completion file already exists.'
       				printf "\nStage3 Script FAILURE: STAGE3.INSTALLED Completion file already exists.\n" 
				exit 1
			fi

		else
			zenity --ellipsize --error  --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Error" --text='<b>\t\tSTAGE3 Installer Failure</b>.\n\nDebug: Can not execute mythtv-setup.'
			printf "\nStage3 Script FAILURE: Can not execute mythtv-setup." 
        		exit 1
		fi
else
        zenity --ellipsize --error  --window-icon=/usr/share/pixmaps/mythtv-setup.png --title="Error" --text='<b>\t\tSTAGE3 Installer Failure</b>.\n\nOnly run this installer as <i>mythtv</i> user.'
       	printf "\nStage3 Script FAILURE: Only run as 'mythtv' user." 
        exit 1
fi
