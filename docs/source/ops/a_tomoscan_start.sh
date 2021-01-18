gnome-terminal --tab --title "ADetector IOC" -- bash -c "ssh -t user2bmb@pg10ge \
'/net/s2dserv/xorApps/PreBuilts/areaDetector-R3-10/ADSpinnaker-R3-1/iocs/spinnakerIOC/iocBoot/iocSpinnaker/softioc/2bmbSpinnaker.sh stop; \
sleep 1; \
/net/s2dserv/xorApps/PreBuilts/areaDetector-R3-10/ADSpinnaker-R3-1/iocs/spinnakerIOC/iocBoot/iocSpinnaker/softioc/2bmbSpinnaker.sh start; \
sleep 1; \
/net/s2dserv/xorApps/PreBuilts/areaDetector-R3-10/ADSpinnaker-R3-1/iocs/spinnakerIOC/iocBoot/iocSpinnaker/softioc/2bmbSpinnaker.sh console; \
bash'" 

gnome-terminal --tab --title "ADetector UI" -- bash -c "ssh -t user2bmb@pg10ge \
'/net/s2dserv/xorApps/PreBuilts/areaDetector-R3-10/ADSpinnaker-R3-1/iocs/spinnakerIOC/iocBoot/iocSpinnaker/softioc/2bmbSpinnaker.sh medm; csh'" 

sleep 10

gnome-terminal --tab --title "tomoScan IOC" -- bash -c "ssh -t user2bmb@pg10ge \
'cd /local/user2bmb/epics/synApps/support/tomoscan/iocBoot/iocTomoScan_2BM/; \
pkill -9 tomoScanApp; \
./start_IOC;\
bash'" 

sleep 5

gnome-terminal --tab --title "tomoScan py server" -- bash -c "ssh -t user2bmb@pg10ge \
'cd /local/user2bmb/epics/synApps/support/tomoscan/iocBoot/iocTomoScan_2BM/; \
bash -c \"source ~/.bashrc; python -i start_tomoscan.py\";\
bash'" 

gnome-terminal --tab --title "tomoScan UI" -- bash -c "ssh -t user2bmb@pg10ge \
'cd /local/user2bmb/epics/synApps/support/tomoscan/iocBoot/iocTomoScan_2BM/; \
./start_medm; \
csh'" 