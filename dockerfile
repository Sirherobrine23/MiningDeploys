FROM ubuntu:latest
RUN apt update && apt install -y curl wget tar unzip zip

# Minings
RUN mkdir -p /Minings

# Download xmrig (XMR)
# xmrig --donate-level 2 -o xmr.pool.minergate.com:45700 -u "$Email" -k --coin monero
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.15.3/xmrig-6.15.3-focal-x64.tar.gz -O xmrig.tar.gz && \
tar xfz xmrig.tar.gz && rm -rfv xmrig.tar.gz && cd *xmrig* && mkdir -p /Minings/xmrig && cp -rfv * /Minings/xmrig

# Download ethminer (ETH)
# ethminer -P stratum+tcp://eth.pool.minergate.com:45791/"$Email"
RUN cd /tmp/ &&  wget --no-check-certificate https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz -O ethminer.tar.gz && tar xfz ethminer.tar.gz && rm -rfv ethminer.tar.gz && cd bin && mkdir -p /Minings/ethminer && cp -rfv * /Minings/ethminer

# Minergate
# minergate-cli --user "$Email" --bcn $(($(nproc) * 2))
RUN wget --no-check-certificate "https://minergate.com/download/xfast-ubuntu-cli/1.2" -O Minergate.deb && dpkg -i Minergate.deb && rm -rfv Minergate.deb

ENV Mining="xmr" Email="srherobrine20@gmail.com"
# PATH=/Minings/xmrig:/Minings/ethminer:$PATH
COPY ./start.sh /bin/start_mining.sh
RUN chmod a+x /bin/start_mining.sh
ENTRYPOINT [ "/bin/start_mining.sh" ]
