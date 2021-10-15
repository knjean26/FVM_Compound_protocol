#Sender Addresses
senderAddress=TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe
partnerAddress=TNxCfiV4NHFFbSPZyi1Rs266YHSCR1PY4G

#Contract Addresses
oracleAddress=076574172f4ff24af3269aef0ae4b503a941d362
myComptrollerAddress=e68dd9d3c095e03c24cc3ec094e1483606724d81

USDTAddress=aff90ddd0a87a3b51c4e0e61b0fbb3f991ee4e69
UNIAddress=fff8c1ff8ccf649c6c49d333fdbc9228385525d5

cUSDTAddress=8c369080297b28ca5e54b883a64b358358c1d301
cUNIAddress=5ed0366ca049e81efc3dc4c79db250b08c5a8349

#Contract ABI
CompABI=~/Desktop/FVM_test2/myComptrollerInterface.json
oracleABI=~/Desktop/FVM_test2/oracleInterface.json
tokenABI=~/Desktop/FVM_test2/tokenInterface.json
cTokenABI=~/Desktop/FVM_test2/cTokenInterface.json

#export PATH=$PATH:/home/ubuntu/.cargo/bin




borrow()
{
        borrowAmount=$1
        borrow_encode=`ethabi encode function $cTokenABI borrow -p $borrowAmount --lenient`
        ../../firovm-cli sendtocontract $cUNIAddress $borrow_encode 0 600000000 0.000001 $senderAddress
}

repayBorrow(){
        repayAmount=$1
        repay_encode=`ethabi encode function $cTokenABI repayBorrow -p $repayAmount --lenient`
        ../../firovm-cli sendtocontract $cUNIAddress $repay_encode 0 600000000 0.000001 $senderAddress
}



echo now we try to borrow UNI 
//echo UNI price was set to 5
echo now UNI in our wallet is 
../../firovm-cli frc20balanceof $UNIAddress $senderAddress
echo then we will borrow 10 UNI
borrow 1000000000
sleep 2
echo now our UNI is 
../../firovm-cli frc20balanceof $UNIAddress $senderAddress





