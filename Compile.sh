#!/bin/bash
# Script for compile Daemon, WalletQt or Create Masternode for BolivarCoin

installAptLibsQt() {
    echo "Installing Libs"
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install  \
      qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools libprotobuf-dev protobuf-compiler software-properties-common build-essential \
      libssl-dev libdb++-dev libboost-all-dev libqrencode-dev qrencode libminiupnpc-dev automake autoconf libzmq3-dev \
      git pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev make g++ gcc libevent-dev libtool autotools-dev
}

installAptLibs() {
    echo "Installing Libs"
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y install  \
      software-properties-common build-essential \
      libssl-dev libdb++-dev libboost-all-dev libminiupnpc-dev automake autoconf autotools-dev libzmq3-dev \
      git pkg-config libcurl4-openssl-dev libjansson-dev libgmp-dev make g++ gcc libevent-dev libtool
}

installBerkeleyDB() {
    echo "Installing Berkeley DB"
    sudo env LC_ALL=C.UTF-8 add-apt-repository -y ppa:bitcoin/bitcoin
    sudo apt-get -y update
    sudo apt-get -y install libdb4.8-dev libdb4.8++-dev
}

checkSystem() {
    echo "Check version Ubuntu"
    . /etc/os-release
    case "$ID-$VERSION_ID" in
        ubuntu-16.04 ) installMN16 ;;
        ubuntu-18.04 ) installMN18 ;;
        * ) echo "ERROR: only Ubuntu 16.04 or 18.04 are supported now."; exit 1;;
    esac
}

installMN16() {
    wget https://github.com/BOLI-Project/BolivarCoin/releases/download/v2.0.0.2/BolivarCoinDaemonUbuntu1604.tar.gz
    tar -xzf BolivarCoinUbuntu1604.tar.gz
    cd DaemonsLinuxBOLI
    chmod 755 bolivarcoind
    chmod 755 bolivarcoin-cli
    chmod 755 bolivarcoin-tx
    mv bolivarcoind /usr/bin
    mv bolivarcoin-cli /usr/bin
    mv bolivarcoin-tx /usr/bin
}

installMN18() {
    wget https://github.com/BOLI-Project/BolivarCoin/releases/download/v2.0.0.2/BolivarCoinDaemonUbuntu1804.tar.gz
    tar -xzf BolivarCoinUbuntu1804.tar.gz
    cd DaemonsLinuxBOLI
    chmod 755 bolivarcoind
    chmod 755 bolivarcoin-cli
    chmod 755 bolivarcoin-tx
    mv bolivarcoind /usr/bin
    mv bolivarcoin-cli /usr/bin
    mv bolivarcoin-tx /usr/bin
}

compileDaemonWallet() {
    echo "Compiling BolivarCoin Daemon Wallet"
    ./autogen.sh
    ./configure
    make -j$(nproc)
    cd src
    strip bolivarcoind
    strip bolivarcoin-cli
    strip bolivarcoin-tx
}

compileQtWallet() {
    echo "Compiling BolivarCoin Qt Wallet"
    ./autogen.sh
    ./configure
    make -j$(nproc)
    cd src/qt
    strip bolivarcoin-qt
}

createMN() {
    CONF_DIR=~/.Bolivarcoin/
    CONF_FILE=Bolivarcoin.conf
    USER=`openssl rand -hex 16`
    PASS=`openssl rand -hex 16`
    IP=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
    PORT=3893
    mkdir $CONF_DIR
    echo ""
    echo "Please enter masternode private key $ALIAS"
    read PRIVKEY
    echo "rpcuser=$USER" >> $CONF_DIR/$CONF_FILE
    echo "rpcpassword=$PASS" >> $CONF_DIR/$CONF_FILE
    echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
    echo "listen=1" >> $CONF_DIR/$CONF_FILE
    echo "server=1" >> $CONF_DIR/$CONF_FILE
    echo "daemon=1" >> $CONF_DIR/$CONF_FILE
    echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
    echo "maxconnections=256" >> $CONF_DIR/$CONF_FILE
    echo "masternode=1" >> $CONF_DIR/$CONF_FILE
    echo "masternodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
    echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
    bolivarcoind
}

PS3='Please enter your choice: '
options=("Compile Qt Wallet" "Compile Daemon Wallet" "Create Masternode")
select opt in "${options[@]}"
do
    case $opt in
        "Compile Qt Wallet")
            echo "Compiling Qt Wallet"
            installAptLibsQt
            installBerkeleyDB
            compileQtWallet
            echo "Complete! Your Qt Wallet is in src/qt/bolivarcoin-qt"
            break
            ;;
        "Compile Daemon Wallet")
            echo "Compiling Daemon Wallet"
            installAptLibs
            installBerkeleyDB
            compileDaemonWallet
            echo "Complete!"
            break
            ;;
        "Create Masternode")
            echo "Creating Masternode"
            installAptLibs
            installBerkeleyDB
            checkSystem
            createMN
            echo "Complete!"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done