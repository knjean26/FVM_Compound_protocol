contractAddress="901d7c46854838cb72b228fffaca3af3cb217667"
interfaceJSON=~/Desktop/CToken_contract/CToken_Implement/interface.json

#Read Contract
admin()
{
    #address_account=$senderAddress
    #hexaddress=`../../firovm-cli gethexaddress $address_account`
    encode_admin=`ethabi encode function $interfaceJSON admin`
    ../../firovm-cli callcontract $contractAddress $encode_admin
}

_becomeImplementation()
{
    #address_account=$senderAddress
    #hexaddress=`../../firovm-cli gethexaddress $address_account`
    encode_admin=`ethabi encode function $interfaceJSON admin`
    #../../firovm-cli callcontract $contractAddress $encode_admin
}

admin