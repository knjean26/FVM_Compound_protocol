senderAddress="TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe"
receiverAddress=""
contractAddress="637d1ffaf8ca8d4aab542160d396df53e61afe5b"
interfaceJSON=~/Desktop/CToken_contract/Comptroller/interface.json

#Read Contract
getAssetIn()
{
    address_account=$1
    hexaddress=`../../firovm-cli gethexaddress $address_account`
    encode_getAssetIn=`ethabi encode function $interfaceJSON getAssetIn -p $address_account`
    ../../firovm-cli callcontract $contractAddress $encode_getAssetIn
}




#Write Contract
enterMarkets()
{
    cToken_address=$1
    encode_enterMarkets=`ethabi encode function $interfaceJSON enterMarkets -p $cToken_addresss`
    ../../firovm-cli sendtocontract $contractAddress $encode_enterMarkets
}

exitMarket()
{
    cToken_address=$1
    encode_exitMarket=`ethabi encode function $interfaceJSON exitMarket -p $cToken_addresss`
    ../../firovm-cli sendtocontract $contractAddress $encode_exitMarket
}

