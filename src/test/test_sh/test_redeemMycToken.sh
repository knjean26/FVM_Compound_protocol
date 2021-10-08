myCTokenAddress="b01b9f3af96475920406cbdfe6b3daf8150f98b3"
myCTokenUTXOAddress=`../../firovm-cli fromhexaddress $myCTokenAddress`
cUSDTinterfaceJSON=/home/knjean/Compound/cUSDT/interface.json

myUSDTAddress="8d14987646d6896034be68067f1e6c5293b1b3af"
USDTinterfaceJSON=/home/knjean/Compound/USDT/interface.json

senderAddress="TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv"
senderHexAddress=`../../firovm-cli gethexaddress $senderAddress`

#ctokenUTXO: TRGZXygvt5uvnuo1ceJK69vrQRwbeqKEAt


#ethabi installation required
redeem()
{
    redeemAmount=$1
    redeem_encode=`ethabi encode function $cUSDTinterfaceJSON redeem -p $redeemAmount --lenient`
    ../../firovm-cli sendtocontract $myCTokenAddress $redeem_encode 0 6000000 0.000001 TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv
}

totalSupply()
{
    totalSupply_encode=`ethabi encode function $cUSDTinterfaceJSON totalSupply`
    output=`../../firovm-cli callcontract $myCTokenAddress $totalSupply_encode`
    echo $output | jq '.executionResult.output'
}

# mint 1000000
# redeem 50000000
totalSupply