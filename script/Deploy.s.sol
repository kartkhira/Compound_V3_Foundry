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

import {Constants} from './Utils/Constants.Mumbai.sol';

contract DeployScript is Script {

    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");

        address deployerPrivateKey = vm.rememberKey(deployer);
        vm.startBroadcast(deployerPrivateKey);

        // Deploy Admin Proxy.
        // This Admin is responsible for proxy updates including implementation updates
        CometProxyAdmin mumbaiCometAdminProxy = new CometProxyAdmin();

        CometExt mumbaiCometExt = new CometExt(CometConfiguration.ExtConfiguration({
            name32: "Compound Chee USDC",
            symbol32: "cUSDCv3"
        }));

        //Deploy Comet Factory
        /// @notice Comet Factory is not being deployed due to crossing code size limit
        //CometFactory mumbaiCometFactory = new CometFactory();

        // Deploy the configurator
        Configurator mumbaiCometConfiguratorImpl = new Configurator();

        // Get the data ready 
        bytes memory data = abi.encodeWithSignature("initialize(address)", deployerPrivateKey);

        // deploy Configurator Transparent proxy
        ConfiguratorProxy mumbaiCometConfiguratorProxy = new ConfiguratorProxy(
            address(mumbaiCometConfiguratorImpl),
            address(mumbaiCometAdminProxy),
            data
        );

        // Cast Configurator Proxy to configurator
        Configurator mumbaiCometConfigurator =  Configurator(address(mumbaiCometConfiguratorProxy));
        
        CometConfiguration.AssetConfig[] memory assetConfigs = new CometConfiguration.AssetConfig[](4);
        assetConfigs[0] = CometConfiguration.AssetConfig({
            asset: Constants.WETH,
            priceFeed: Constants.WETH_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 82e16,
            liquidateCollateralFactor: 85e16    ,
            liquidationFactor: 93e16,
            supplyCap: 50_000e18
        });

        assetConfigs[1] = CometConfiguration.AssetConfig({
            asset: Constants.WBTC,
            priceFeed: Constants.WBTC_PRICE_FEED,
            decimals: 8,
            borrowCollateralFactor: 7e17,
            liquidateCollateralFactor: 75e16,
            liquidationFactor: 93e16,
            supplyCap: 20_000e8
        });

        assetConfigs[2] = CometConfiguration.AssetConfig({
            asset: Constants.WMATIC,
            priceFeed: Constants.WMATIC_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 82e16,
            liquidateCollateralFactor: 85e16,
            liquidationFactor: 93e16,
            supplyCap: 500_000e18
        });

        assetConfigs[3] = CometConfiguration.AssetConfig({
            asset: Constants.DAI,
            priceFeed: Constants.DAI_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 79e16,
            liquidateCollateralFactor: 85e16,
            liquidationFactor: 93e16,
            supplyCap: 1_000_000e18
        });


        // deploy Comet Implementation
        Comet mumbaiCometImpl = new Comet(CometConfiguration.Configuration(
            {
                governor: deployerPrivateKey,
                pauseGuardian: deployerPrivateKey,
                baseToken: Constants.USDC,
                baseTokenPriceFeed: Constants.USDC_PRICE_FEED,
                extensionDelegate: address(mumbaiCometExt),
                supplyKink: 8e17,
                supplyPerYearInterestRateSlopeLow: 325e16,
                supplyPerYearInterestRateSlopeHigh: 4e17,
                supplyPerYearInterestRateBase: 0,
                borrowKink: 8e17,
                borrowPerYearInterestRateSlopeLow: 35e16,
                borrowPerYearInterestRateSlopeHigh: 25e17,
                borrowPerYearInterestRateBase: 15e16,
                storeFrontPriceFactor: 5e17,
                trackingIndexScale: 1e15,
                //Fill these Two values correctly in real deployment
                baseTrackingSupplySpeed: 0,
                baseTrackingBorrowSpeed: 0,

                baseMinForRewards: 10000e6,
                baseBorrowMin: 100e6,
                targetReserves: 5000000e6,
                assetConfigs: assetConfigs
            }
        ));

        // Deploy Transparent Comet Proxy
        TransparentUpgradeableProxy mumbaiCometProxy = new TransparentUpgradeableProxy(
            address(mumbaiCometImpl),
            deployerPrivateKey,
            bytes("")
        );

        //Cast comet Proxy to Comet
        Comet cometMumbai = Comet(payable(address(mumbaiCometProxy)));

        // Set the factory for configurator
        // COmet Factory is not being deployed due to crossing code size limit
        //mumbaiCometConfigurator.setFactory(address(cometMumbai), address(mumbaiCometFactory));

        // Deploy Rewards contract and set Comet and reward token
        CometRewards mumbaiCometRewards = new CometRewards(deployerPrivateKey);
        mumbaiCometRewards.setRewardConfig(address(cometMumbai), Constants.REWARD_TOKEN);

        vm.stopBroadcast();

        uint256 deployer_second = vm.envUint("PRIVATE_KEY_SECOND");

        address deployerPrivateKeySecond = vm.rememberKey(deployer_second);
        vm.startBroadcast(deployerPrivateKeySecond);
        cometMumbai.initializeStorage();
        vm.stopBroadcast();
    }
}
