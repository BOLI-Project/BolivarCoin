# scrypt para instalar la Wallet de BolivarCoin en GNU/Linux

# Actualizar el sistema e instalar dependencias
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools build-essential libssl-dev libdb++-dev libboost-all-dev libqrencode-dev libminiupnpc-dev qrencode libqrencode-dev git automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ gcc-6 g++-6
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev

# Compilar la wallet
qmake "USE_QRCODE=1"
make
