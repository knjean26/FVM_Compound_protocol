myCTokenAddress="b01b9f3af96475920406cbdfe6b3daf8150f98b3"
myCTokenUTXOAddress=`../../firovm-cli fromhexaddress $myCTokenAddress`
cUSDTinterfaceJSON=/home/knjean/Compound/cUSDT/interface.json

myUSDTAddress="8d14987646d6896034be68067f1e6c5293b1b3af"
USDTinterfaceJSON=/home/knjean/Compound/USDT/interface.json

senderAddress="TLhMq3Xqsr1cmXuw4VykGLvwJFTwqp6Xiv"
senderHexAddress=`../../firovm-cli gethexaddress $senderAddress`

#ctokenUTXO: TYWPwCn4P1Pp3Gak8WJHLGW99vjrAZGMmX

#approve dummy USDT contract for mycToken contract
approve()
{
    sender=$1
    spender=$2
    amount=10000000000000
    ../../firovm-cli frc20approve $myUSDTAddress $sender $spender $amount
    echo "cToken has been approved"
}

approve $senderAddress $myCTokenUTXOAddress
# You can check if the account is being approved successfully by typing
# firovm-cli frc20allowance <USDT contract address> <sender> <cUSDT contract address>
# in command line

echo "approve contract successfully"
