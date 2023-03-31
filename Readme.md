## Compound V3 contracts using Foundry Framework


### To load the variables in the .env file
source .env

### To deploy and verify our contract
forge script script/Deploy.s.sol:DeployScript --rpc-url $MUMBAI_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify  $ETHERSCAN_API_KEY -vvvv


### Deployed Contract Addresses
1. CometProxyAdmin : https://mumbai.polygonscan.com/address/0x826a5dbc15354873d0f39b34fa5b277369a5c994

2. CometExt : https://mumbai.polygonscan.com/address/0x46e8ddf813beb49fe4944816f119360c9523fe4b

3. Configurator : https://mumbai.polygonscan.com/address/0x47aa2ccabac3d246622e1b6f13887291d3e2e273

4. ConfiguratorProxy : https://mumbai.polygonscan.com/address/0xd31dd8a3bd5850be3bf037f42959b8551c8e3dc5

5. Comet: https://mumbai.polygonscan.com/address/0xe1c07ac669c2363e8078fb7d6dd9d0adcd230ff1

6. TransparentUpgradeableProxy : https://mumbai.polygonscan.com/address/0x7540774d583efdcf7ec4826f575c7c5e05312975

7. CometRewards : https://mumbai.polygonscan.com/address/0x12e8bd1908eef137bf22e216aa7b949bad572f7e

