// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

import "forge-std/Script.sol";

import "../src/CometProxyAdmin.sol";
import "../src/CometExt.sol";
import "../src/CometFactory.sol";
import "../src/Comet.sol";

import "../src/vendor/proxy/transparent/TransparentUpgradeableProxy.sol";
import "../src/Configurator.sol";
import "../src/ConfiguratorProxy.sol";
import "../src/CometRewards.sol";

import {Constants} from './Utils/Constants.Alfajores.sol';

contract DeployScript is Script {

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.broadcast(deployerPrivateKey);
        /**
        NftMinter nft = new NftMinter("Euphoric_Chee", 
            "ECHEE", 
            Constants.baseURI, 
            Constants.notRevealedURI,
            Constants.merkleRoot);
        */
        vm.stopBroadcast();
    }
}
