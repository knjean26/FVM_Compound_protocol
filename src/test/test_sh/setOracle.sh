#Sender Addresses
senderAddress=TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe
partnerAddress=TNxCfiV4NHFFbSPZyi1Rs266YHSCR1PY4G

#Contract Addresses
oracleAddress=076574172f4ff24af3269aef0ae4b503a941d362
myComptrollerAddress=e68dd9d3c095e03c24cc3ec094e1483606724d81

USDTAddress=aff90ddd0a87a3b51c4e0e61b0fbb3f991ee4e69
UNIAddress=fff8c1ff8ccf649c6c49d333fdbc9228385525d5

cUSDTAddress=8c369080297b28ca5e54b883a64b358358c1d301
cUNIAddress=6e706d3ee7a8dfc5f5a8f88a061860f3d6c70a6f

#Contract ABI
CompABI=~/Desktop/FVM_test2/myComptrollerInterface.json
oracleABI=~/Desktop/FVM_test2/oracleInterface.json
tokenABI=~/Desktop/FVM_test2/tokenInterface.json
cTokenABI=~/Desktop/FVM_test2/cTokenInterface.json

#export PATH=$PATH:/home/ubuntu/.cargo/bin




setOraclePrice()
{

        setOraclePrice_encode=`ethabi encode function $cTokenABI setOraclePrice -p $oracleAddress --lenient`
        ../../firovm-cli sendtocontract $cUNIAddress $setOraclePrice_encode 0 6000000 0.000001 $senderAddress
}

echo now we have to set fake oracle price for our UNI
setOraclePrice
echo setOracle is done


