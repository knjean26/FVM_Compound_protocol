myCTokenAddress="b01b9f3af96475920406cbdfe6b3daf8150f98b3"
myCTokenUTXOAddress=`../../firovm-cli fromhexaddress $myCTokenAddress`
cUSDTinterfaceJSON=/home/knjean/Compound/cUSDT/interface.json

myUSDTAddress="8d14987646d6896034be68067f1e6c5293b1b3af"
USDTinterfaceJSON=/home/knjean/Compound/USDT/interface.json

senderAddress="TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv"
senderHexAddress=`../../firovm-cli gethexaddress $senderAddress`

#ctokenUTXO: TYWPwCn4P1Pp3Gak8WJHLGW99vjrAZGMmX


#ethabi installation required
mint()
{
    mintAmount=$1
    mint_encoded=`ethabi encode function $cUSDTinterfaceJSON mint -p $mintAmount --lenient`
    ../../firovm-cli sendtocontract $myCTokenAddress $mint_encoded 0 6000000 0.000001 TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv
}

totalSupply()
{
    totalSupply_encode=`ethabi encode function $cUSDTinterfaceJSON totalSupply`
    ../../firovm-cli callcontract $myCTokenAddress $totalSupply_encode
}

debugComp()
{
    debugComp_encode=`ethabi encode function $cUSDTinterfaceJSON debugComp -p $senderHexAddress --lenient`
    ../../firovm-cli callcontract $myCTokenAddress $debugComp_encode
}

debugblock()
{
    debugblock_encode=`ethabi encode function $cUSDTinterfaceJSON debugblock -p $senderHexAddress --lenient`
    ../../firovm-cli callcontract $myCTokenAddress $debugblock_encode
}

mint 100000000
# totalSupply
# debugComp
# debugblock