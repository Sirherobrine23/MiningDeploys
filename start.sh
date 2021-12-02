#!/Bin/bash
set -x
case $Mining in
  xmr)
    xmrig --donate-level 2 -o xmr.pool.minergate.com:45700 -u "$Email" -k --coin monero
  ;;
  eth)
    ethminer -P stratum+tcp://eth.pool.minergate.com:45791/"$Email"
  ;;
  *)
    minergate-cli --user "$Email" --bcn $(($(nproc) * 2))
  ;;
esac
