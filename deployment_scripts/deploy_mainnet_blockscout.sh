#!/bin/bash

# Source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm use 20.18.0
yarn cache clean
yarn install
echo "[]" > blacklist.remote.json
yarn forge:simulate scripts/deploy/deploy-fiat-token.s.sol --rpc-url mainnet --legacy
yarn forge:broadcast scripts/deploy/deploy-fiat-token.s.sol --rpc-url mainnet --legacy
yarn forge:verify-blockscout scripts/deploy/deploy-fiat-token.s.sol --rpc-url mainnet --legacy
