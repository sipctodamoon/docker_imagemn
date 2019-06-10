#!/bin/sh

if [ -z "$MNPRIVKEY" ]; then
    echo "generating new mn private key and ip addr"
    cd /
    ./ImageCoind -daemon
    sleep 5s;
    export MNPRIVKEY=`./ImageCoin-cli masternode genkey`
    
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    echo masternodeprivkey=$MNPRIVKEY >> ~/.imagecoincore/imagecoin.conf
    echo externalip=`curl ifconfig.co` >> ~/.imagecoincore/imagecoin.conf
    echo masternode=1 >> ~/.imagecoincore/imagecoin.conf
    echo "stopping imaged"
    ./ImageCoin-cli stop
    sleep 5s;
else
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    sed -i '$d' ~/.imagecoincore/imagecoin.conf
    echo masternodeprivkey=$MNPRIVKEY >> ~/.imagecoincore/imagecoin.conf
    echo externalip=`curl ifconfig.co` >>~/.imagecoincore/imagecoin.conf
    echo masternode=1 >> ~/.imagecoincore/imagecoin.conf
fi

cat ~/.imagecoincore/imagecoin.conf
echo "starting imaged"
cd /root
./ImageCoind
