Compound Protocol Test Cases
=====================================

https://github.com/knjean26/FVM_Compound_protocol

What is Compound?
----------------

Compound Protocol is an Ethereum project that focuses on allowing borrowers to take out loans and lenders to provide loans by locking their assets into the protocol.


Development Process
-------------------

The `test_sh` branch is regularly built and tested by forking the sorce code from Compound Protocol. The test cases are currently focus on CToken and Comptroller.

`CToken` is the primary means of interacting with the Compound Protocol. When a user mints, redeems, borrows, repays a borrow, liquidates a borrow, or transfers cTokens, she will do so using the cToken contract.

`Comptroller` is the risk management layer of the Compound protocol; it determines how much collateral a user is required to maintain, and whether (and by how much) a user can be liquidated. Each time a user interacts with a cToken, the Comptroll is asked to approve or deny the transaction.

Configurations
-------------------
1. set up firovm by following the instruction on [FiroVM](https://github.com/nopslide/firovm) or skip this step if you are done
        
        
Build
----------------------
1.  cd to your src directory and clone the source:

        git clone https://github.com/knjean26/FVM_Compound_protocol/new/main/src/test/test_sh

2.  The bytecode and abi of each contract can be found inside https://github.com/knjean26/Compound_FVM `/<contract name>/byte.txt` and `/<contract name>/interface.json`. You can also compile your own byte code and ABI using [Remix](https://remix.ethereum.org)
3.  
    Copy the bytecode of the contract you want to test and paste it using this command
    
        ./firovm-cli createcontract <bytecode>
    
    It will show:
        
        {
          "txid": "72b0e0576d289c1e4e6c777431e4845f77d0884d3b3cff0387a5f4a1a3a874ea",
          "sender": "qZbjaE8N18ZU1m7851G7QGhvxKL74SRBTt",
          "hash160": "aff3e34ab836edb8d214a993d9da105915e4a6e9",
          "address": "5bde092dbecb84ea1a229b4c5b25dfc9cdc674d9"
        }
    
    copy the address of your contract and paste it using this command
    
        ./firovm-cli getaccountinfo <your contract address>
        
    Something similar to this will appear
    
        {
          "address": "5bde092dbecb84ea1a229b4c5b25dfc9cdc674d9",
          "balance": 0,
          "storage": {
            "290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563": {
              "0000000000000000000000000000000000000000000000000000000000000000": "0000000000000000000000000000000000000000000000000000000000000001"
            }
          },
          "code": "..."
        }
        
    If the terminal shows this error `Address could not be found`, you might run out of gas. Run `./auto_block_generate.sh` to generate a new block every 15 minutes (by default) and repeat the create contract step once again.
    
    Use the command
    
        ./firovm-cli getbalance <your address>
        
    If your wallet is still empty, you can use this command to generate to your address directly
    
        ./firovm-cli generatetoaddress 200 <your address>
        

3.  Run `./firovm-cli getnewaddress` to create an address that will be use in test cases.

4.  Copy and paste `senderAddress` and `contractAddress` at the beginning of each test file. Include your ABI for each contract, name it `interface.json` and set a path to variable at the beginning of each test file.

    test_sh/test_setupMycToken.sh
   
        myCTokenAddress=<cUSDT address>
        cUSDTinterfaceJSON=<path to interface.json>

        myUSDTAddress=<USDT address>
        USDTinterfaceJSON=<path to interface.json>

        senderAddress=<sender address>
        
    Note: spaces are not allowed, so please be careful!

Testing
-------

1.  Test the function:

    Inside each file in `test_sh` folder, look for the contract and function you want to run your test.
    You can uncommend the function name at the bottome of each code to test each function separately. You can also uncommend all the function names to test all the function inside the contract.
    On command line, type `./ + name of test file`. For example
    
        ./test_setupMycToken.sh
        ./test_mintMycToken.sh

### Notes 

original FVM source code [FiroVM](https://github.com/nopslide/FiroVM)
lib for rpc call and smartcontract development [qtumjs](https://github.com/qtumproject/qtumjs)  
cli for smartcontract deployment [solar](https://github.com/qtumproject/solar)  
to config genesis on EVM chain [genesis](./src/cpp-ethereum/libethashseal/genesis/fvmMainNetwork.cpp)  
DAO contract DGP Qtum pre-loaded contract [source](https://github.com/qtumproject/qtum-dgp)
