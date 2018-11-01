# script para instalar la Wallet de BolivarCoin en GNU/Linux
# Actualizar el sistema e instalar dependencias
sudo apt install libssl1.0-dev 
sudo apt install qt5-default qt5-qmake qtbase5-dev-tools qttools5-dev-tools 
sudo apt install build-essential 
sudo apt install libdb++-dev 
sudo apt install libboost-all-dev 
sudo apt install libqrencode-dev libminiupnpc-dev 
sudo apt install libjansson-dev 
sudo apt install libgmp-dev 
# Posible error en esta línea 
sudo apt install libcurl-openssl1.0-dev 
sudo apt install git automake autoconf pkg-config make g++ gcc qrencode 
# Add Bitcoin repository PPA
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt update
sudo apt install libdb4.8-dev libdb4.8++-dev
# Compilar la wallet
qmake "USE_QRCODE=1"
make