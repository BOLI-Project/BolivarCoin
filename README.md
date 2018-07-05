¿Qué es Bolivarcoin? 
===============================
Bolivarcoin es una Criptomoneda que nació en el año 2015. 
Creada bajo el mando de Satoshisimon Bolivarmoto. 
Ésta está basada en la cultura Bitcoin, orientada a mantener el anónimato, la velocidad de transacciones y la libertad financiera.

Especificaciones técnicas:
---------------------
Algoritmo de cifrado: X11
Cantidad final de Monedas: 25.000.000
Intervalo entre Bloques: 3 minutos
Puerto RPC: 3563
Puerto P2P: 3893

Procedimiento para instalar la billeterá virtual en GNU/Linux con GUI:
---------------------
Escribir en la terminal los siguientes comandos:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
git clone https://github.com/ElpidioMC/Bolivarcoin
cd Bolivarcoin

## Para Ubuntu 17.10 y anteriores.
chmod +x compilar.sh
./Compilar.sh
./Bolivarcoin-qt

## Para Ubuntu 18.04 y superiores.
chmod +x compilar.sh
./Compilar_Ubuntu18.sh
./Bolivarcoin-qt
```
