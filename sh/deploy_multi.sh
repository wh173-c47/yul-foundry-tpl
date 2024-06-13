!# /bin/bash

source .env

chains=('SEPOLIA' 'ETH' 'OPT' 'BSC' 'MATIC' 'ZKSYNC' 'ARB' 'BASE' 'SCROLL' 'LINEA' 'OPBNB' 'ARBNOVA' 'ARBNOVA' 'AVA')

for chain in "${chain_scripts[@]}"; do
  rpc_var_name="${chain}_RPC_URL"
  rpc="${!rpc_var_name}"

  forge script --chain $chain script/Contract.s.sol:ContractScript --rpc-url $rpc --broadcast -vvvv
