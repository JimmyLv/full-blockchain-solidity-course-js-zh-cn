#! /bin/bash


# output_filename=$1_$(date +"%Y_%m_%d_%I_%M_%p").srt
output_filename="outputs/$1"

sed \
 -e 's/solidity/Solidity/g' \
 -e 's/Aetherium/Ethereum/g' \
 -e 's/ ether / Ether /g' \
 -r "$1" > "${output_filename}"

webstorm "${output_filename}"
