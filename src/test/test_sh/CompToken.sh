contractAddress="e6fb130ca68112efaefafb0a69fcc62c92a9c56c"
interfaceJSON=~/Desktop/CToken_contract/CompToken/interface.json

#Read Contract
admin()
{
    #address_account=$senderAddress
    #hexaddress=`../../firovm-cli gethexaddress $address_account`
    encode_admin=`ethabi encode function $interfaceJSON admin`
    #../../firovm-cli callcontract $contractAddress $encode_admin
}

admin