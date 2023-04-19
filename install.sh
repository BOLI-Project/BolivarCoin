#!/bin/bash
# Script for compile Daemon, WalletQt or Create Masternode for BolivarCoin

updateSystem() {
    echo "Updating System Libs"
    sudo apt-get -y update
    sudo apt-get -y upgrade
}

installDaemon() {
    echo "Installing BolivarCoin Daemon"
    wget https://github.com/BOLI-Project/BolivarCoin/releases/download/v2.0.0.2/bolivarcoin-x86_64-linux-gnu.deb
    sudo dpkg -i bolivarcoin-x86_64-linux-gnu.deb
    rm bolivarcoin-x86_64-linux-gnu.deb
}

installQT() {
    "Installing BolivarCoin QT Wallet"
    wget https://github.com/BOLI-Project/BolivarCoin/releases/download/v2.0.0.2/bolivarcoin-qt-x86_64-linux-gnu.deb
    sudo dpkg -i bolivarcoin-qt-x86_64-linux-gnu.deb
    rm bolivarcoin-qt-x86_64-linux-gnu.deb
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
options=("Install Qt Wallet" "Install Daemon Wallet" "Create Masternode")
select opt in "${options[@]}"
do
    case $opt in
        "Install Qt Wallet")
            updateSystem
            installQT
            echo "Complete! Your Qt Wallet was installed"
            break
            ;;
        "Install Daemon Wallet")
            updateSystem
            installDaemon
            echo "Complete!"
            break
            ;;
        "Create Masternode")
            echo "Creating Masternode"
            updateSystem
            installDaemon
            createMN
            echo "Complete! Your Masternode was installed"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done