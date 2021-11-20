#!/Bin/bash
#
if [ -z "$Email" ];then
  echo "Email env is blank"
  exit 1
fi
wget https://github.com/xmrig/xmrig/releases/download/v6.15.3/xmrig-6.15.3-focal-x64.tar.gz -O xmrig.tar.gz
tar xfz xmrig.tar.gz
rm -rfv xmrig.tar.gz
cd *xmrig*
screen -dm ./xmrig --donate-level 2 -o xmr.pool.minergate.com:45700 -u "$Email" -k --coin monero

