# Script to generate a new block every 15 seconds
# Put this script at the root of your unpacked folder
#!/bin/bash

echo "Generating a block every 15 seconds. Press [CTRL+C] to stop.."

address=`./src/firovm-cli getnewaddress`

while :
do
        echo "Generate a new block `date '+%d/%m/%Y %H:%M:%S'`"
        ./src/firovm-cli generatetoaddress 1 $address 100000
        sleep 10
done