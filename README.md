The automythsvr-eit-stages are where the main coding is, that makes the automythsvr project work. It's a rather simple shell script installer program with examples I took straight from the book(s) and modified for my use.
Also note these scripts were not designed to be used seperately originally, but I will work to make them more distro agnostic. The live config also has a lot still in it related to setting up the ISO, but its quite boring stuff that I just didn't put in a rpm yet.

It's not "real" solid coding I know, I would prefer it be done in C/C++. However, the scripts have a lot left to work out before that can start. Eg. Static db entries in stage1 need to be seperated out into dynamic commands just in case something upstream changes fast.

The scripts still lack validation in areas, and could have failure points I didnt anticipate. I only addressed the common case failures, NOT THE WEIRD and more difficult ones (at least for me).Eg. Like what happens when your HDHR is GOING OFF/ONLINE randomly due to network errors or you unplugging it during a script detection, I have not figured that out yet. As of now, the script will miss your device if its not seen at the beginning of startup.

This the best I can do right now. I have to learn some more about advanced shell scripting.
I'll add more features after Christmas, but I will address major bugfix requests as needed. 

Regarding interacting with me, if any. 
	
	If you don't plan on interacting with me. 
	Just skip down to below the horizontal rule at "Welcome to Automythsvr HDHR EIT!" Yes I come with a disclaimer, live with it! If this bothers you that much, You probably should come with your own disclaimer.

This is the short version!
Some of this is what I wanted to say after I shut down my old site. Since I worked with Linux since about 1995, I figure I'm entitlied to use this site for my rants, if I so choose. I have code too :)

So here we go:

I have bi-polar disorder and non-military PTSD and it's widley known, I don't 'PLAY WELL' with others as well as most.
If you are my enemy and want to use this information, let me help you more. I never was on it and never will be.
Now switch to the people that dont know me(almost everyone, you just read what I've wrote and formed your opinions from others opinions).
I have been ostersized and downsized and critizied and last but not least stigmatized....Wa wah waaa. So what. I'm 47 years old
and that's the best you could summate from a backwoods NON RECORDING JURISDICTION? Wow you impress and fool so easily.
Did you really think I was going to go down by the efforts of a bunch of hillbilly overpaid unrecording shameful MORONS? Even after I misteped and talked too much when I was angry? LOL Nope. I'm not done.
I may be the strangest person you have ever heard of, still I'm me.
You may not like my ways and methods but since I am not a criminal or perverted or even dangerous, other than my mouth....You can just enjoy, at will. Ocassionaly I find a person that tolerates me but I've always been a overly sensitive rebel loner, even before I acknowledged my mental difficulties. I did this project solo so far because I enjoyed it and it's even theraputic for me. Contrary to what other peoples opinions may be about my wide interests, I really like shell scripting/C/C++ and I will continue to do this.  One day I expect to write it well enought that no one can tell I wrote it, the point is because of my stigma's I want to write my code anonymously, yet open source. So no one can say what I do is not worthy over and over, just because of my hard life and responses. Many wish to exile all those with mental difficulties from common social areas. 
 Many of you work/live with mentally ill people every day whom are in denial. 
 Perhaps they are that quiet person that never talks, then all of sudden when they do talk it appears over the top. 
 Or perhaps its the person that talks all the time about every single piece of information that floats by their minds. 
 Or perhaps its the person that crys or laughts out of no where from some unknown trigger over a slightly harsh comment. 
 Or the person that is always harsh to others and seems to have no empathy. 
 Or perhaps its that person whom you think has the biggest ego in the room, yet everyone suspects has the opposite, as insecurities.
 Or perhaps its the person that judges externally outward all the time and hardly ever self reflects. Get my point?
 Human beings have problems, while I have only recently admitted I have bi-polar. I've only done this to open awareness that bipolar people are not all the creative genious's you desire. Most have social problems that have plenty to do with trust.
 Trust is something you learn, no what your given. If you grow up without trusting people and without a proper perception I'm sure a untrusting person would have a extremely difficult life. 
 Select Corporations and other powers that be want to bury the truths about mental health so deep that you could never comprehend that systems problems. I grew up watching the failures of the mental health systems in both of my parents,
 so you un-experienced know it alls, dont know jack about reality and applied human psychology when it comes to the case studies I have analyized starting at  5 years old. I also have always self-analysed as well, how else did you think I made it this far with two mentally ill parents, luck? You'd have to be nuts if you think I could have done as well as I have without it(reflection).

e-PILL or theSmurtPill?
I have real problems with the new methods of medication monitoring. Abilify you suck, your opening the door to descriminate against the mentally ill, not just the "alleged dangerious ones either". With your technology combined with overzealous corupt 
punishers will result in abuses of the patient. Is this your job Abilify? Profit while you appease everyone except the patient?
MORONS with more greed for money than humanity, thats what you are. Sue me, if is not true. Prove it's not true if I said it you morons.

Take the greedy profit desires of a corporation thats facing competition from alternative therapies.
Take corupt authorities in power in jurisdictions with weak governments.
Take one mentally ill person that has not proven to be violent or dangererous, but has proven to have a big mouth that posts online very controversial but legal information. Lets say that person takes all people on at will no matter how famous or how
protected a group may be, I dunno say a city manager or say the local pd.
Now lets call that mentally ill person a Internet Protester and pretend they have the same rights as the constitution affords
most.
Can you see where a power shift is changing here?
The corrupt system wants a method to shut down people from speaking about things the dont want said.
They can't be jailed easily because usually it's political fallout. The corupt systems can abuse the system except so far, and this is another TOOL for powerful bullies to violate others.

We may be fat, and greedy in America but are we all MORONS too? Find a better way to deal with mentally ill, or your just
repeating the past mistakes. 
Stigma, shame and power manipulation against those that speak out but are "DIFFICULT" to stop.
You think your/our children can escape the future that is being created? Your wrong, and later when reason TRUMPS over POWER/Control, YOUR DIRTY METHODS WILL BE REVERSED.


The only way a democratic society should let Abilify(invasive) E-PILL is in a scenario of lawful judicial punishment. 
Eg.
Lets see a person has been convicted of a crime(in a honorable court of law that produces transcripts), and it has come out that the person has a mental defect.

Give the criminally insane convicted a choice then, 
A) Take your meds
or 
B) If your violent, we tell everyone your off your meds and due our social duty to the world.
or
C) Go to regular jail as a criminal and take your normal sentence.

A/B: This while unethical would be more appropriate as a convicted criminal still can take A or B
This would be a true representation about protecting society.

Do it right abilify. Do your trials on prisoners and parollees, dont you dare LUMP sum everyone with a mental defect to your
measures, its unethical and unconstitutional...
Which infers as to why you sorry Ducks make it optional now for NON PRISONERS, cause you couldnt get approval for prisoners or that profit potential didnt appeal to you enough? Which is it? So you said, Screw it, lets get all Americans on this, that a lot more profitable and we can use everyones natural fear to help us sell.
Wow, good plan if you didnt have any thinkers analysing your crap, what you call marketing.
Enjoy your next three year run, MORONS.

In this scenario, I could see where abilify epill could be justified. A convict has lost rights and while on probation or parole
can be subjected. Outside of this, you need to find another way to profit, YOUR MORONS if NOT.


Lets say you have a "Snowden" type that you would love to hush up and lucky for you, they live right here in the USA , still.
***You can keep up with this, your almost done.....***If you head hurts have a beer and come back to read later***

Lets say this citizen protestor(Snowden like) is on Abilify with etracking. Authorities have been notified by the patients psychologist informally that a potentially dangerous person is off their medications.

The complaints start coming into the local police department about this "Citizen Protestor" from the conservative side first.
Then as the fear is spread like wildfire, they recruit more liberal thinkers into the mix.
Once enough people fear a single person, its quite easy for them all to  agree on what they would like to happen, shut that person up.

Since they are in this country and have volunteered for e-pill, they are now on the hot seat and likely harrassed at every local level possible.

Now  you may be thinking, hey hold on, that's a great tool I wish all us non-recording cities in Oregon had....STOP
you yourself can be on this dirty end of the stick too, just ask for help one day in the SYSTEM.

This system appeases BIG PHARMA first, then it appeases psychologists whom dont want to take any blame or stigma from a potential patient going bezerk.  Then last but now least it will appease the enemies of any patient as all the locals have to do is say, "Yeah, Julie over at dispatch told us all, he/she is off their medication"....BAM pre-judged, sentenced and all they want now is you to GO AWAY, and they have most of the tools to force you.

Meanwhile, all the people that thought they were doing the right thing. Get under the feet of the above, you dont matter. They will tell you, would you prefer we lock you up and give you shock treatment like the old days or do you want to take your epill
and by the way, STOP POSTING POLITICALY ON THE INTERNET. 

Now, I'm a creative person as many of you know, I'm also very logical. What you didnt know is that I've been taking the very same medication that works for me for over 30 years.  Now for you smart know it alls you might smuggy  laugh and say huh huh, we can all see that doesnt work. BUT YOUR WRONG, I have tried all the so called "mental health" medicinces from BIG PHARMA.

My mother tried them, my father was forced to try them. That brain modifing crap does nothing for my happiness at any time because I'm broken in a way that ABILIFY and OTHER EASY FIX MEDs can NOT HELP. 

I stay away from stimulants except  I flirt with coffee.
I avoid stressful scenarios as much as possible, especially if my FEARDAR goes off. "FEARDAR? yes, its how I changed over the years to become overly sensitive. I didnt develop FEARDAR on purpose, it happened from growing up in small southern oppressive towns where everyone knew my parents and my history. I learned to become more introverted and not share make friends easy.
I also had to temper this with a strong ethical base, which I luckily got from the very same people that pursecuted me.

Look at it this way,
Alabama is? or was overly religious and opppressive and highly descrimanatory about just about everything, when I grew up the first 19 years. Even given all that, I got plenty of love from a few good people along the way. They taught me what my parents could not, I had to learn the rest the hard way.

Lets take  Oregon and compare to Alabama, has all the same compenents except extreme liberalism gets added to the mix.
Also, take note OREGON has a BROKEN NON RECORDING SYSTEM OF LAWS for crimes below FELONIES, which leaves CORUPT POLITICIANS A GAPING HOLE TO ABUSE.

I am a good person but flawed because of how I grew up in Alabama, had  I grew up in Oregon with all the horrible CRAP and lawless society. I likely would have become some kind of serial killer or at least a permanent mental patient in a Salem Oregon Asylum. According to statitics, which I beat already btw, I should have been much more of a criminal that Eugene Oregon ever claimed I was. Only problem is, I had a pretty great life of improvement before meeting the lawless city of Eugene Oregon.
I had no idea a city or cities could charge, have a jury trial and even jail you without one single COURT RECORDING.
Now I do, and so does all the enemies I made. They used that system against me for speaking out against their SO CALLED LOCAL HEROS.

FFWD. Oregon is the REAL SHITHOLE because of what it does to children that grow up in that place. NOT other countries, our own SHITHOLES ARE RIGHT HERE, many are full of white trash with sub standard educations and exhuberant prideful egos. Yeah I said it, and I'm white. 


DO NOT TAKE YOUR FAMILY TO OREGON FOR ANY REASON OTHER THAN VACATIONS, unless you visit one of the HONORABLE 6 CITES that decided recording is a "GOOD THING". Oregon is a beautiful place with the craziest fauna you have ever seen. How do I know?
Cites I lived in before Eugene were great.
Austin,TX  Los Angeles, CA  Linden, UT  Orlando,FL Charleston,SC  Asheville,NC Birmingham,AL Phoenix,AZ Scottsdale,AZ

Heed what I say, not all places and cities in Oregon are bad, just all but 6.
http://www.courts.oregon.gov/courts/Pages/other-courts.aspx

Justice/Municipal Courts of Record
In accordance with Senate Bill 267 (2007), justice or municipal courts that are currently, or will become, courts of record and those that cease operating as a court of record are to file a declaration to that effect with the Supreme Court for acknowledgement.

Acknowledgements as Courts of Record:

West Linn
St. Helens
Lake Oswego
Beaverton
Florence
Milwaukie


Dont be fooled by my enemies whom are destined by greed and power to live the rest of their lives in Sodom or Ghomorah.
I back up what I say.

Eugene Oregon and its broken system and corupt managment made me as crazy as you deem me to be. Ask someone that knew me before Oregon, those liars had to re-write the truth. I exposed their flawed bullshit bully methods when they tried to pull that shit on me and all  the choice I left them was to VIOLATE ME AND MY FAMILY OVER AND OVER. I have evidense to prove it, video and statements and more. If I use it one day it will be in the Western US Federal District, not in a SORRY LITTLE HILLBILLY BACKWOODS NON REORDING STATE EITHER. My lawers will come from Cali to spank your unconstitutional shameful bully ways.


Why would I put this personal info here? 
Firstly, I love Linny's place so much and since he has called Oregon home just like me for a long time, I'm sure he wont mind anyway.

I tried to give up Linny's kernel and failed, if you can't beat em , JOIN EM.
Seriously, why did I fail so miserably with the BSD's and my projects?
Because i'm not skilled enough in C/C++ yet.  So yeah, I'm back on the Redhat and Linny Bandwagon for now.

I know what many have told you, this is not a place for personal whatever.
Lucky for us all I'm limiting this to my readme and not the actual scripts, scripts are all business, as 'they' say.

1. This is not the workplace.
2. Even in the workplace you can not help but know personal things about one another though visual observance, before you talk.
3. Many people just get uncomfortable with the idea because they like to pack their emotions in another compartment.
4. When you meet strangers in public humans generally are on their best behavior, in this environment its not the same.
5. I and other people with personality issues such as Bi-polar don't intend to be "adversarial or abrasive", but generally 	 I think I can safely say many have higher expectations than others about interactions, I am one. Conversely, some are carefree about them and care not to address uncomfortable talk, good plan if we were robots! We are not all cut from the same cloth.
6. Keep in mind, just like a Autustic person can overload at times, other disorders have similar problems with interactions.


Other Warnings:
My scripting skills I consider all my work previous computer science work before this was practice, as this was my first serious shell script project. I'm not a professionally trained computer science person, I'm a hobbyist though I worked in IT years ago as a admin and in help desk(s). A GED and a few community college credits are  my 'current' highest education, so easy on the judgements, your lucky I can type. :) Seriously, I do have some IT Certs as well, but no formal academic computer science training. I did start a couple php/python classes once but I finished neither as it was a difficult time and environment for me to be attempting it. Fyi, most admin and help desk work is NOT computer science ojt. As I was told years ago by many potential employers and random peers, "I am not an engineer." I'm over that painful reality(though I actually claimed to be one in the first place), so you call me what you want NOW ....Engineers! Technician, crazy, whatever! 
Point, Due to lack of enough formal mathematics and Com Sci backing me up, you will find knowledge gaps and errors in my hobby work. 
However, my imperfections do not stop me from enjoying this work, I enjoy Computer Science so much, that It's a life goal(top of the bucket list) that I finish somewhere with a least a ComSci Minor BA/BS Degree. I think I've covered this good enough for now or else I'll write a book in the middle of a shell script readme file. 

Do not stop learning mathematics and logic if your career choice may be in Computer Science, you can never get enough or too much. I'm lucky that I'm blessed with the ability to do many things and I have tried/done. Change is my friend, I understand it is not everyones comforatable pal. So take a lesson from me, like computing, do all your math or else "You can't have any pudding if you dont' eat your meat!" :)

Below is the readme from (SF, where you can download the ISOs, for now)
*Any references to "we" in my work are wishful future thinking at this time, I did not plan to release this under my name at first. Then I changed my mind after much thought.

***

Welcome to Automythsvr HDHR EIT!
ATSC OTA 8vsb Build.

Build Code named:  "XMas Gift2"



AutoMythSvr Installer Requirements:

	x86_64 Compatible Computer:
	At least one ethernet connection, up to *4 supported.
	Minimum 1G Ram recommended
	At least one 32G storage device per Tuner is recommended.
	*1-8 SiliconDust or Compatible 2 or 4 Tuner ATSC(8vsb) Devices

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



Example scenario A:
	
	User install on a local home network with a router that provides dhcpd to a laptop
	with one network card and one internal hard disk, and access to one dual tuner ATSC hdhr unit
	connected to a single "rabbit ears" type antenna. One user/family use model.


Example  scenario B:
	
	Power User Install on a local home network with a router, server with a built-in 2 port
	ethernet and a raid array of hard disks and (2)  Quad Tuner HDHRs, connect by a yagi
	50 mi uni-directional antenna. Multi use model with 4 simultaneous  VPN clients 
	running mythfrontend.


Example  scenario C:
	
	Largest Install: with 4U Server with built-in 4 port
	ethernet, flash OS Storage, (2) 6-drive raid arrays of hard disks and (8)  QuadTuner HDHRs.(32 Tuners),
	connected to one external multiplexed antenna array.  Multi use network model
	with database reconfigured for direct network client/server mode bypassing vpn.


Pre-configured accounts:
	
	Password for mysql root dbadmin=
	Password for root=automythg36
	Password for mythtv=mythtv
	*mythtv has full sudo powers!
	User/Password for phpMyAdmin=mythtv


While in the Live Session on the first boot;
From a terminal as root or sudo, you can install the liveimg anytime by running :
	
	liveinst
	
from the cmd line in terminal
or by clicking `"Install to Hard Drive"` from ,
the ICEWM startmenu > System > `"Install to Hard Drive"`



General Notes:
	
	Ethernet Channel bonding is the default, even if you only have one ethernet. If your
	connection is 100MB, and you have more than 2 HDHR Devices, you should consider adding
	ethernet device(s) to reduce the chance of bandwidth problems. 
	If you max the capabilities out make sure you have plenty of high performance storage
	Flash Storage arrays and/or a traditional hard disk for every 4 Tuners.
	Consider also that the system will likely perform better with a 100Mbs connection equivelent
	for every 3-4 Tuners. 

Unsupported HDHRs:
	
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
    	Feel free to do that alone as developers are holding off for now, as in "Your On You Own if you change your hostname."
 

	Q. If I only have one ethernet, do I need to change bond0 to a regular interface name?
	A. No, it will likely not affect you in any way, but the next question will help you break the bond if desired.

	Q. I really don't like this network setup at all I only have one laptop and one ethernet or similar reason.
    	   How can I switch back to the new systemd naming with no bonding, method after the install?
	A. Easily with the proper commands an proceedures!
   
   	Shutdown mythfrontend/mythbackend/mariadb services with : systemctl stop servicename
   		echo -bond0 > /sys/class/net/bonding_masters
   		rmmod bonding
   	Remove the ifcfg-bond0 and ifcfg-ethX files from /etc/sysconfig/network-scripts/
   	Remove the file /etc/modules-load.d/bonding.conf
   	Update /etc/default/grub:  by removing the entries "biosdevname=0 net.ifnames=0" from stanza GRUB_CMDLINE_LINUX
   	Then run: 
		grub2-mkconfig -o /boot/grub/grub.cfg
 	or if using EFI
   		grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg
	Then reboot and you using "Consistent Network Device Naming" again with no ethernet bonding.
   	Finally, after reboot, sync up conkyrc with your default device name.
   	Eg. In the files: /etc/skel/.conkyrc & /home/mythtv/.conkyrc , change the reference near end of file from "bond0" to
    	"ens3" if your primary ethernet adapter is labeled "ens3". You can find the new device name easy from running
     		nmcli con show -a
	When your done updating conky, within seconds your desktop conky should refresh and show your IP again.
	
	Q. How can I regnerate new VPN client certificates?
	A. NOTDONEYET.FUTURESTUBONLY.Use the script as sudo: /usr/bin/createNewClientCert.sh

	Q. Can I run yum update to keep my kernel/other critical security packages up to date?
	A. Yes, manually and very carefully until we work out any unforseen problems.
   	We will re-enable upsteam autoupdating in later releases, including updates to our packages.

	Q. Why did you not use the latest version of mythtv?
	A. Development started and frozen to the 28.1 Series for this release.

	Q. When will a new version be released?
	A. Undetermined.

	Q. How can I use this system with  DVB, or other devices, if I have no HDHRs?
	A. Do the install.
	
		1)Let Automythsvr installer fail to end.
		2)Remove the automythsvr-eit-stages rpm with 
			
			rpm -e automythsvr-eit-stages
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
	`	systemctl start mythfrontend service


Unfinished:

	Openvpn server side presetup.
	Hostapd presetup.
	You will have to configure these two own your own till I finish them in future rebuilds.
	Even then, if you use them outside of home you should probably regenerate new ones anyway,
	so I'm in no rush on adding them. Should be easy though. When I do add them I think I can make the keys unique on
	startup for every host by using the machine-id and a service that only starts outside of livetv and after reboot.
	Simple @reboot cron job append should work once I setup my scripts.

Testing: 

	I've done most all my testing in virtualization, kvm.
	I did a few tests on older chromeboxes,chromebooks and a few netbooks and it works. 
	I have no idea if it will boot on apple/mac or not, I put the rpms in the lineup, but I have no newer mac to test it 		against right now.

	
*I'm working to improve the markdown language here for readability.

Not all files here are currently being called/included in scripts. Some are just stubs or templates intended for future use.

