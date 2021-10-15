#Sender Addresses
senderAddress=TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe
partnerAddress=TNxCfiV4NHFFbSPZyi1Rs266YHSCR1PY4G

#Contract Addresses
oracleAddress=076574172f4ff24af3269aef0ae4b503a941d362
myComptrollerAddress=e68dd9d3c095e03c24cc3ec094e1483606724d81

USDTAddress=aff90ddd0a87a3b51c4e0e61b0fbb3f991ee4e69
UNIAddress=fff8c1ff8ccf649c6c49d333fdbc9228385525d5

cUSDTAddress=5da0d4e78ffc77087c75a97010051c07d78a5188
cUNIAddress=5ed0366ca049e81efc3dc4c79db250b08c5a8349

#Contract ABI
CompABI=~/Desktop/FVM_test2/myComptrollerInterface.json
oracleABI=~/Desktop/FVM_test2/oracleInterface.json
tokenABI=~/Desktop/FVM_test2/tokenInterface.json
cTokenABI=~/Desktop/FVM_test2/cTokenInterface.json

#export PATH=$PATH:/home/ubuntu/.cargo/bin




mint()
{
        mintAmount=$1
        mint_encode=`ethabi encode function $cTokenABI mint -p $1 --lenient`
        ../../firovm-cli sendtocontract $cUSDTAddress $mint_encode 0 6000000 0.000001 $senderAddress
}
redeem()
{
        redeemAmount=$1
        redeem_encode=`ethabi encode function $cTokenABI redeem -p $redeemAmount --lenient`
        ../../firovm-cli sendtocontract $cUSDTAddress $redeem_encode 0 6000000 0.000001 $senderAddress
}
balanceOf()
{
        account=`../../firovm-cli gethexaddress $senderAddress`
        balanceOf_encode=`ethabi encode function $cTokenABI balanceOf -p $account --lenient`
        ../../firovm-cli callcontract $cUSDTAddress $balanceOf_encode 
}



echo now our USDT is 
../../firovm-cli frc20balanceof $USDTAddress $senderAddress
echo now we deposit 1000 USDT 
mint 100000000000
sleep 2
echo Deposit is done

echo now our USDT is 
../../firovm-cli frc20balanceof $USDTAddress $senderAddress



