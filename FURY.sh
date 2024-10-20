#!/bin/bash

ling="@FURYx307" # credit
Color_Off='\e[0m'   # Text Reset
BIPurple='\e[1;95m' # Purple
BICyan='\e[1;96m'   # Cyan

GL="com.tencent.ig" # package for Global version

tt="
"
# next line
PS3=(" 3.4.0 Fixed reset $tt $tt Select option to reset guest ")
echo -e "${Color_Off}"
options=("Reset Guest ID" "Exit")
select opt in "${options[@]}"
do
case $opt in
"Reset Guest ID")

am force-stop $GL
clear
rm -rf /data/data/$GL/shared_prefs /storage/emulated/0/Documents/
mkdir /data/data/$GL/shared_prefs
chmod 777 /data/data/$GL/shared_prefs
rm -rf /data/data/$GL/files

GUEST="/data/data/$GL/shared_prefs/device_id.xml"
rm -rf $GUEST
echo "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <string name=\"random\"></string>
    <string name=\"install\"></string>
    <string name=\"uuid\">$RANDOM$RANDOM-$RANDOM-$RANDOM-$RANDOM-$RANDOM$RANDOM$RANDOM</string>
</map>" > $GUEST
rm -rf /data/data/$GL/databases
rm -rf /data/media/0/Android/data/$GL/files/login-identifier.txt
rm -rf /data/media/0/Android/data/$GL/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate
touch /data/media/0/Android/data/$GL/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate
rm -rf /data/media/0/Android/data/$GL/files/TGPA
touch /data/media/0/Android/data/$GL/files/TGPA
rm -rf /data/media/0/Android/data/$GL/files/ProgramBinaryCache
touch /data/media/0/Android/data/$GL/files/ProgramBinaryCache
iptables -I OUTPUT -d cloud.vmp.onezapp.com -j REJECT
iptables -I INPUT -s cloud.vmp.onezapp.com -j REJECT

echo "Your Guest ID has been reset successfully."
echo "Script created by @Ninja"
exit

;;
"Exit")
echo "Script created by @Ninja"
exit # exit script
;;
*) echo "Invalid option $REPLY";;
esac
done
