myCTokenAddress="b01b9f3af96475920406cbdfe6b3daf8150f98b3"
myCTokenUTXOAddress=`../../firovm-cli fromhexaddress $myCTokenAddress`
cUSDTinterfaceJSON=/home/knjean/Compound/cUSDT/interface.json

myUSDTAddress="8d14987646d6896034be68067f1e6c5293b1b3af"
USDTinterfaceJSON=/home/knjean/Compound/USDT/interface.json

senderAddress="TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv"
senderHexAddress=`../../firovm-cli gethexaddress $senderAddress`

compTokenAddress="cfe8fe4136881b677c5dd59de2b85447e9c6eec3"

#ctokenUTXO: TYWPwCn4P1Pp3Gak8WJHLGW99vjrAZGMmX


#ethabi installation required
setCompAddr()
{
    compAddress=cfe8fe4136881b677c5dd59de2b85447e9c6eec3
    comp_encoded=`ethabi encode function $cUSDTinterfaceJSON setCompAddr -p $compAddress --lenient`
    ../../firovm-cli sendtocontract $myCTokenAddress $comp_encoded 0 6000000 0.000001 TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv
}

name_()
{
    comp_encoded=`ethabi encode function $cUSDTinterfaceJSON name_`
    ../../firovm-cli callcontract $myCTokenAddress $comp_encoded
}

admin()
{
    comp_encoded=`ethabi encode function $cUSDTinterfaceJSON admin`
    ../../firovm-cli callcontract $myCTokenAddress $comp_encoded
}

setCompAddr
# admin