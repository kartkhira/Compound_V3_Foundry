## Compound V3 contracts using Foundry Framework


# To load the variables in the .env file
source .env

# To deploy and verify our contract
forge script script/Deploy.s.sol:DeployScript --rpc-url $MUMBAI_RPC_URL --broadcast --verify $ETHERSCAN_API_KEY -vvvv