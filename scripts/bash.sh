#! /bin/bash


# output_filename=$1_$(date +"%Y_%m_%d_%I_%M_%p").srt
output_filename="outputs/$1"

sed \
 -e 's/solidity/Solidity/g' \
 -e 's/chain link|chainlink/Chainlink/g' \
 -e 's/Aetherium/Ethereum/g' \
 -e 's/ ether/ Ether/g' \
 -e 's/eath/ETH/g' \
 -e 's/Ether scan/Etherscan/g' \
 -e 's/Funmi|Fundmi/FundMe/g' \
 -e 's/fun function/fund function/g' \
 -e 's/合同/合约/g' \
 -e 's/Metamask|meta mask/MetaMask/g' \
 -r "$1" > "${output_filename}"

#prettier "${output_filename}" --write
