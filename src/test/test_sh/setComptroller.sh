#Sender Addresses
senderAddress=TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe
partnerAddress=TXd4nHHDbNaiL6YVjU6Zp2oLHWwzDz7NZD

#Contract Addresses
oracleAddress=076574172f4ff24af3269aef0ae4b503a941d362
myComptrollerAddress=e68dd9d3c095e03c24cc3ec094e1483606724d81

USDTAddress=aff90ddd0a87a3b51c4e0e61b0fbb3f991ee4e69
UNIAddress=fff8c1ff8ccf649c6c49d333fdbc9228385525d5

cUSDTAddress=ee8141c06daea89c97931648b8825639dd062337
cUNIAddress=87eb5c17123a938023365edaa588c886a9a7e664

#Contract ABI
CompABI=~/Desktop/FVM_test2/myComptrollerInterface.json
oracleABI=~/Desktop/FVM_test2/oracleInterface.json
tokenABI=~/Desktop/FVM_test2/tokenInterface.json
cTokenABI=~/Desktop/FVM_test2/cTokenInterface.json

#export PATH=$PATH:/home/ubuntu/.cargo/bin

#AddToMarketList
addToMarket()
{
        address=$1
        hexaddress=`../../firovm-cli gethexaddress $senderAddress`
        addToMarket_encode=`ethabi encode function $CompABI addToMarket -p $hexaddress --lenient`
        ../../firovm-cli sendtocontract $myComptrollerAddress $addToMarket_encode 0 6000000 0.000001 $senderAddress
}

removeFromMarket(){
        address=$1
        hexaddress=`../../firovm-cli gethexaddress $senderAddress`
        removeFromMarket_encode=`ethabi encode function $CompABI removeFromMarket -p $hexaddress --lenient`
        ../../firovm-cli sendtocontract $myComptrollerAddress $removeFromMarket_encode 0 6000000 0.000001 $senderAddress
}

readMarket()
{
        readMarket_encode=`ethabi encode function $CompABI readMarket`
        ../../firovm-cli callcontract $myComptrollerAddress $readMarket_encode
}

liquidityOf()
{
        UTXO=`../../firovm-cli gethexaddress $senderAddress`
        echo $UTXO
        a_encode=`ethabi encode function $CompABI liquidityOf -p $UTXO --lenient`
        #a_encode=`ethabi encode function $CompABI readMarket`
        ../../firovm-cli callcontract $myComptrollerAddress $a_encode
}


addToMarket $cUSDTAddress
sleep 2
echo addToMarket successful
addToMarket $cUNIAddress
sleep 2
echo addToMarket successful
readMarket



# removeFromMarket cUSDTAddress
# sleep 2
# removeFromMarket cUNIAddress
# sleep 2
# readMarket
