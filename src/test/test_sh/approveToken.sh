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


#approveUSDTandUNI
approve()
{
        sender=$1
        spenderUSDT=$cUSDTAddress
        spenderUNI=$cUNIAddress
        UTXOspenderUSDT=`../../firovm-cli fromhexaddress $spenderUSDT`
        UTXOspenderUNI=`../../firovm-cli fromhexaddress $spenderUNI`
        ../../firovm-cli frc20approve $USDTAddress $sender $UTXOspenderUSDT 10000000000000
        echo USDT has been approved
        ../../firovm-cli frc20approve $UNIAddress $sender $UTXOspenderUNI 10000000000000
        echo UNI has been approved
     
}

echo This part will send some UNI to cUNIContract for being UNI supply
../../firovm-cli frc20transfer $UNIAddress $senderAddress `../../firovm-cli fromhexaddress $cUNIAddress` 1
sleep 2
echo transfer successfully
approve $senderAddress





