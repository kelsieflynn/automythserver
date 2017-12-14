The automythsvr-eit-stages are where the main coding is, that makes the automythsvr project work, a shell script installer program. The live config also has a lot still in it related to setting up the ISO, but this is the portion I feel others might want to look at.

No, its not "real" solid coding I would prefer, like C/C++, but It will be one day. The scripts have a lot left to work out before that can start.
Yes, it still lacks validation in areas where the scripts could fail, I only addressed the common case failures, NOT THE WEIRD and more difficult ones (at least for me), eg. like what happens when your HDHR is GOING OFF/ONLINE randomly due to network errors or you unplugging it during a script detection, I have not figured that out yet. It will miss your device if the script does not see it when it starts up.

This the best I can do right now. I'll fix more after Christmas If it's important enough.

Regarding interacting with me,
This is the short version!
I have bi-polar disorder and non-military PTSD and it's widley known, I don't 'PLAY WELL' with others as well as most.
However, I do share and give back. I did this project solo so far because I enjoyed it and it's even theraputic for me.
Contrary to what other peoples opinions may be about my wide interests, I really like shell scripting/C/C++ and I will continue to do this.  One day I expect to write it well enought that no one can tell I wrote it, the point is because of my stigma's I want to write my code anonymously, yet open source. So no one can say what I do is not worthy over and over, just because of my hard life and responses. Many wish to exile all those with mental difficulties from common social areas. Many of you work/live with mentally ill people every day whom are in denial. Perhaps they are that quiet person that never talks, then all of sudden when they do talk it appears over the top. Or perhaps its the person that talks all the time about every single piece of information that floats by their minds. Or perhaps its the person that crys or laughts out of no where from some unknown trigger over a slightly harsh comment. Or the person that is always harsh to others and seems to have no empathy. Or perhaps its the person that judges externally outward all the time and hardly ever self reflects. Get my point?


Why would I put this personal info here? I know what many have told you, this is not a place for personal whatever.
A) This is not the workplace.
B) Even in the workplace you talk and know personal things about one another though visual observance before you talk.
C) Many people just get uncomfortable with the idea because they like to pack their emotions in another compartment.
D) When you meet strangers in public humans generally are on their best behavior, in this environment its not the same.
E) I and other people with personality issues such as Bi-polar don't intend to be "adverserial or abrasive", but generally I think I can say my crazy brothers and sisters may have higher expectations than others about interactions.
F) Just like a Autustic person can overload, other disorders have similar problems.
I think I've covered this good enough for now or else I'll write a book in the middle of a shell script. 



Other Warnings:
My scripting skills I consider all my work previous computer science work before this was practice, as this was my first serious shell script project.
I'm not a professionally trained computer science person, I'm a hobbyist though I worked in IT years ago.
GED is my current highest education so easy on the judgements, your lucky I can type. :)
I taught myself what I know through reading, or learned some on the job(s) and picked the rest up. 
I have to learn on the fly often as I'm sure I have in common with many of you. 
You will find knowledge gaps and errors.
However, there is some hope, I'm cursed with a desire of perfection. Which means, I change fast as I learn.
I really enjoy working out the steps and then seeing the results later.



Back to the fun stuff you likely care about more than my mental problems...:


Below is the readme from (SF, where you can download the ISOs, for now)
*Any references to "we" in my work are wishful future thinking at this time, I did not plan to release this under my name after first. Then I changed my mind after much thought.

Welcome to Automythsvr HDHR EIT!
ATSC OTA 8vsb Build.

Build Code named:  "XMas Gift2"



AutoMythSvr Installer Requirements:

x86_64 Compatible Computer:
	At least one ethernet connection, up to *4 supported.
	Minimum 1G Ram recommended
	At least one 32G storage device per Tuner is recommended.


*1-8 SiliconDust or Compatible 2 or 4 Tuner ATSC Devices

A Local Network With dhcpd server/hdhr device(s)
	Only  vsb8, (typical US free air broadcast tv) is supported by the autoinstall
	at this time due to the stage 1 8vsb db preload.(The next release is slated to have
	pre-install selection option to use qam or different types other than 8vsb.)

Optionally:
*1 AP Capable WIFI device to use as a Wireless Access Point.


Special Considerations:
*Only 1 video input source will be configured automatically. The installers Configuration expects
 you have one common antenna connected to all your active Tuners. 
*Array of Antennas Multiplexed okay as well.


Software Environment:
Ent.Linux 7.4
Configured with additional software from repos:
elrepo, epel, rpmfusion and automyth_repo


mythtv-0.28.1 g36fe0ce 
mythplugins: mytharchive,mythmusic,mythgallery,mythzoneminder
OpenVPN
IceWM with Components from Xfce4
Chromium v61.0.3163.100 
PhpMyAdmin






#Example scenario A:
User install on a local home network with a router that provides dhcpd to a laptop
with one network card and one internal hard disk, and access to one dual tuner ATSC hdhr unit
connected to a single rabitt ears antenna. One user/family use model.


#Example  scenario B:
Power User Install on a local home network with a router, server with a built-in 2 port
ethernet and a raid array of hard disks and (2)  Quad Tuner HDHRs, connect by a yagi
50 mi uni-directional antenna. Multi use model with 4 simultaneous  VPN clients 
running mythfrontend.


#Example  scenario C:
Largest Install: with 4U Server with built-in 4 port
ethernet, flash OS Storage, (2) 6-drive raid arrays of hard disks and (8)  QuadTuner HDHRs.(32 Tuners),
connected to one external multiplexed antenna array.  Multi use network model
with database reconfigured for direct network client/server mode bypassing vpn.


#pre-configured accounts
Password for mysql root dbadmin=
Password for root=automythg36
Password for mythtv=mythtv
*mythtv has full sudo powers!
User/Password for phpMyAdmin=mythtv


While in the Live Session on the first boot;
From a terminal as root or sudo, you can install the liveimg anytime by running :

liveinst

from the cmd line in terminal
or by clicking "Install to Hard Drive" from ,
the ICEWM startmenu > System > "Install to Hard Drive"



General Notes:
Ethernet Channel bonding is the default, even if you only have one ethernet. If your
connection is 100MB, and you have more than 2 HDHR Devices, you should consider adding
ethernet device(s) to reduce the chance of bandwidth problems. 

If you max the capabilities out make sure you have plenty of high performance storage
Flash Storage arrays and/or a traditional hard disk for every 4 Tuners.

Consider also that the system will likely perform better with a 100Mbs connection equivelent
for every 3-4 Tuners. 

Unsupported HDHRs.
The Original Single tuner "Blue" hdhr is not supported at this time.
HDHR racks are not supported though they may work, untested.
QAM/Cable ATSC Device connections are not supported in this release.
CableCard HDHR devices are not supported.


Random FAQs:

Q. Did AutoMyth Developers get upstream SIG pre-approval? Is this even endorsed as a supported sub project
   of RANDOMNAME ?
A. No and no.

Q. Can I use this installer on disto Xyz, instead of this?
A. Sure just get the "automythsvr-eit-stages" SRPM or RPM and extract modify for your target.
   You will find the sources here on this livemedia, follow the link in mythtv's homedir.


Q. Would it have not been better to do this in C/C++, many high level programmers consider your 
   working with archaic methods without formal APIs.

A. Shell scripting is what was used,  with intent for lower level C or C++ longterm.
   This is the prototyping for a compiled version, and will be done when it's time. 
  
Q. Can I change the hostname during the install? I want my DHCP provided name to the server?
A. It will break the install process. You can redo the scripts with your preset hostname and rebuild 
   as the autoinstall process will NOT work without updating its associated variables internaly. 
    In the future a new method may be implimented that will not  start the install stages until 
    a DHCPd hostname is provided, and update the scripts dynamically afterwards.
    Feel free to do that alone as we are holding off for now, as in "Your On You Own if you change your hostname."
 

Q. If I only have one ethernet, do I need to change bond0 to a regular interface name?
A. No, it will likely not affect you in any way, but the next question will help you break the bond if desired.

Q. I really don't like this network setup at all I only have one laptop and one ethernet or similar reason.
    How can I switch back to the new systemd naming with no bonding, method after the install?
A. Surely!
   Shutdown mythfrontend/mythbackend/mariadb services with : systemctl stop servicename
   echo -bond0 > /sys/class/net/bonding_masters
   rmmod bonding
   Remove the ifcfg-bond0 and ifcfg-ethX files from /etc/sysconfig/network-scripts/
   Remove the file /etc/modules-load.d/bonding.conf
   Update /etc/default/grub:  by removing the entries "biosdevname=0 net.ifnames=0" from stanza GRUB_CMDLINE_LINUX
   Then run: grub2-mkconfig -o /boot/grub/grub.cfg
 	or grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg #if using EFI
   Then reboot and you using "Consistent Network Device Naming" again with no ethernet bonding.
   Finally, after reboot, sync up conkyrc with your default device name.
   Eg. In the files: /etc/skel/.conkyrc & /home/mythtv/.conkyrc , change the reference near end of file from "bond0" to
    "ens3" if your primary ethernet adapter is labeled "ens3". You can find the new device name easy from running
     nmcli con show -a
	When your done updating conky, within seconds your desktop conky should refresh and show your IP again.
	
Q. How can I regnerate new VPN client certificates?
A. NOTDONE.Use the script as sudo: /usr/bin/createNewClientCert.sh

Q. Can I run yum update to keep my kernel/other critical security packages up to date?
A. Yes, manually and very carefully until we work out any unforseen problems.
   We will re-enable autoupdating in later releases, including updates to our packages.

Q. Why did you not use the latest version of mythtv?
A. Development started and frozen to the 28.1 Series for this release.

Q. When will a new version be released?
A. Undetermined.

Q. How can I use this system with  DVB, or other devices, if I have no HDHRs?
A. Do the install.
	1)Let Automythsvr installer fail to end.
	2)Remove the automythsvr-eit-stages rpm with #rpm -e automythsvr-eit-stages
	3)Run mythtv-setup
  		a) Run #1 Menu Option "General" and configure.
 		b) Run #2 Menu Option "Capture cards",  and choose "Delete all capturecards
			on automythsvr-g36fe0ce"
  		c) Run #4 Menu Option "Video Sources", and choose "Delete all video sources"
  		d) Run #2 Menu Option Again, choosing your device.
  		e) Run #4 Menu Option Again, Setup your Video Source.
  		f) RUn #5 Menu Option "Input Connections", assign your input and scan for channels here as needed.
  		g) Run #6 Menu Option "Channel Editor", review channels and delete bogus or any you do not want.

	Exit and make sure mythbackend/mythfrontend services are running.
	systemctl enable mythbackend service
	systemctl start mythbackend service

	systemctl enable mythfrontend service
	systemctl start mythfrontend service


Unfinished:

Openvpn server side presetup.
Hostapd presetup.

You will have to configure these two own your own till I finish them in future rebuilds.
Even then, if you use them outside of home you should probably regenerate new ones anyway,
so I'm in no rush on adding them. Should be easy though. When I do add them I think I can make the keys unique on startup 
for every host by using the machine-id and a service that only starts outside of livetv and after reboot.
Simple @reboot cron job append will work once I setup my scripts.

Testing: I've done most all my testing in virtualization, kvm.
I did a few tests on older chromeboxes and it worked. 
I have no idea if it will boot on apple/mac or not, I put the rpms in the lineup, but I have no newer mac to test it against right now.

*Yes, I can see I'm going to have to improve a lot on markdown language here


