senderAddress="TQchosxmtVZo3DfGvZuXYTG9qcMoUPdexe"
receiverAddress=""
contractAddress="a646413b720e85e371031194f2a70fc7279e81b3"
interfaceJSON=~/Desktop/CToken_contract/InterestRateModel/interface.json
#--------------------------- InterestRateModel Contract testing ---------------------------


#Read Contract
baseRatePerBlock()
{
 encode_baseRate=`ethabi encode function $interfaceJSON baseRatePerBlock`
 ../../firovm-cli callcontract $contractAddress $encode_baseRate
}


blocksPerYear()
{
encode_blocksPerYear=`ethabi encode function $interfaceJSON blocksPerYear`
 ../../firovm-cli callcontract $contractAddress $encode_blocksPerYear
}


getBorrowRate()
{
    cash=''
    borrows=''
    reserves=''
}


getSupplyRate()
{
    cash=''
    borrows=''
    reserves=''
    reserveFactorMantissa=''
}

isInterestRateModel()
{
    encode_isInterestRateModel=`ethabi encode function $interfaceJSON isInterestRateModel`
    ../../firovm-cli callcontract $contractAddress $encode_isInterestRateModel
}

jumpMultiplierPerBlock()
{
    encode_jumpMultiplierPerBlock=`ethabi encode function $interfaceJSON jumpMultiplierPerBlock`
    ../../firovm-cli callcontract $contractAddress $encode_jumpMultiplierPerBlock
}

kink()
{
    encode_kink=`ethabi encode function $interfaceJSON kink`
    ../../firovm-cli callcontract $contractAddress $encode_kink
}

multiplierPerBlock()
{
    encode_multiplierPerBlock=`ethabi encode function $interfaceJSON multiplierPerBlock`
    ../../firovm-cli callcontract $contractAddress $encode_multiplierPerBlock
}

owner()
{
    encode_owner=`ethabi encode function $interfaceJSON owner`
    ../../firovm-cli callcontract $contractAddress $encode_owner
}

utillizationRate()
{
    cash=''
    borrows=''
    reserves=''
}



#1
#baseRatePerBlock

#2
#blocksPerYear

#3

#4

#5
#isInterestRateModel

#6 log wei
#jumpMultiplierPerBlock

#7
#kink

#8
#multiplierPerBlock

#9
owner

#10