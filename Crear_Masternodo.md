Nota: esta guía fue creada para ser usada en **Ubuntu Server 16.04 LTS o Ubuntu Server 18.04 LTS.**

##  Instalar Masternodo BolivarCoin:

1. Abra su Billetera BolivarCoin Core (Billetera instalada en su computadora personal).


2. Diríjase a la **Consola de Depuración** de su billetera:

```Herramientas -> Consola de Depuración```


3. Escriba lo siguiente para generar una nueva dirección:

```getaccountaddress MN1```


4. Envíe 5000 BOLIs a la dirección recién creada:

```sendtoaddress BBBBBBBBBBBBBBBBBBBBB 5000``` - **BBBBBBBBBBBBBBBBBBBBB** representa la dirección recién creada.


5. Genere la **llave privada de su Masternodo**:

```masternode genkey``` - Esta es la **llave privada de su Masternodo**, guárdela en un lugar seguro.


6. Ahora vaya a su VPS y escriba:

```
wget https://raw.githubusercontent.com/BOLI-Project/BolivarCoin/master/Compile.sh
chmod +x Compile.sh
./Compile.sh
```


7. Seleccione la opción 3.


8. Cuando el script le muestre "Please enter masternode private key" por favor escriba la **llave privada de su Masternodo**.


9. Vuelva a su Billetera BolivarCoin Core (en su computadora personal), entre en la Consola de Depuración y escriba:


```masternode outputs``` - Guarde los datos generados en un lugar seguro.


10. Lo siguiente es editar el archivo masternode.conf, para ello vaya a:

```Herramientas -> Abrir Archivo de Configuración de Masternodo```


11. Agregue una nueva linea a este archivo siguiendo este ejemplo:

```MN1 123.456.678.901:3893 masternodeprivkey collateral_output_txid collateral_output_index```

**123.456.678.901** es la dirección IP de su VPS.
**masternodeprivkey** es la **llave privada de su Masternodo** generada en el paso 5.
**collateral_output_txid** valor generado en el paso 9.
**collateral_output_index** valor generado en el paso 9, generalmente es "0" o "1".


12. Guarde el archivo y active la pestaña Masternodos en la billetera BolivarCoin Core:

```Configuración -> Opciones... -> Monedero -> Mostrar pestaña Masternodes```


13. Abra de nuevo su billetera BolivarCoin Core, espere que la operación de envío de monedas realizada en el paso 4 se confirme. Luego en la pestaña Masternodos inicie su Masternodo:

```Masternodos -> Mis Masternodes -> MN1 -> Iniciar alias```