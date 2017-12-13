#I rarely use this script, REMOVE ME Soon?
#!/bin/bash
printf "cleaning up oldfiles and database"\\n\\n
/usr/bin/am_resetMythconverg.sh
systemctl --no-reload enable automythsvr-eit-stage1.install.service||: 2>/dev/null
systemctl --no-reload enable automythsvr-eit-stage2.install.service||: 2>/dev/null
systemctl --no-reload enable automythsvr-eit-stage3.install.service||: 2>/dev/null
systemctl daemon-reload||: 2>/dev/null
rm -rfv /home/mythtv/stage2-capturecard-*.sql 2>/dev/null
rm -rfv /home/mythtv/STAGE1.INSTALLED 2>/dev/null
rm -rfv /home/mythtv/STAGE2*READY 2>/dev/null
exit 0

