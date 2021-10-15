#Sender Addresses
senderAddress=TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe
partnerAddress=TNxCfiV4NHFFbSPZyi1Rs266YHSCR1PY4G

#Contract Addresses
oracleAddress=076574172f4ff24af3269aef0ae4b503a941d362
myComptrollerAddress=e68dd9d3c095e03c24cc3ec094e1483606724d81

USDTAddress=aff90ddd0a87a3b51c4e0e61b0fbb3f991ee4e69
UNIAddress=fff8c1ff8ccf649c6c49d333fdbc9228385525d5

cUSDTAddress=5da0d4e78ffc77087c75a97010051c07d78a5188
cUNIAddress=6e706d3ee7a8dfc5f5a8f88a061860f3d6c70a6f

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

borrow()
{
        borrowAmount=$1
        borrow_encode=`ethabi encode function $cTokenABI borrow -p $borrowAmount --lenient`
        ../../firovm-cli sendtocontract $cUSDTAddress $borrow_encode 0 600000000 0.000001 $senderAddress
}

../../firovm-cli frc20approve $USDTAddress $senderAddress `../../firovm-cli fromhexaddress $cUSDTAddress` 10000000000000
sleep 3

../../firovm-cli frc20balanceof $USDTAddress $senderAddress
mint 1000000000000
sleep 2
../../firovm-cli frc20balanceof $USDTAddress $senderAddress

redeem 5000000000000
sleep 2
../../firovm-cli frc20balanceof $USDTAddress $senderAddress

borrow 1000000000000
sleep 2
../../firovm-cli frc20balanceof $USDTAddress $senderAddress