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

import {configMumbai} from"./Utils/configuration.sol";
import {Constants} from './Utils/Constants.Alfajores.sol';

contract DeployScript is Script {

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.broadcast(deployerPrivateKey);
        CometProxyAdmin mumbaiCometAdminProxy = new CometProxyAdmin();
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        CometExt mumbaiCometExt = new CometExt(CometConfiguration.ExtConfiguration({
            name32: "Compound Chee USDC",
            symbol32: "cUSDCv3"
        }));
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        CometFactory mumbaiCometFactory = new CometFactory();
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        Configurator mumbaiCometConfigurator = new Configurator();
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        mumbaiCometConfigurator.initialize(deployerPrivateKey);
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        ConfiguratorProxy mumbaiCometConfiguratorProxy = new ConfiguratorProxy(
            mumbaiCometConfigurator,
            mumbaiCometAdminProxy,
            []
        );
        vm.stopBroadcast();

        CometConfiguration.AssetConfig[] memory assetConfigs = new CometConfiguration.AssetConfig[](4);
        assetConfigs[0] = CometConfiguration.AssetConfig({
            asset: Constants.WETH9,
            priceFeed: Constants.WETH9_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 82e17,
            liquidateCollateralFactor: 85e17    ,
            liquidationFactor: 93e17,
            supplyCap: 50_000e18
        });

        assetConfigs[1] = CometConfiguration.AssetConfig({
            asset: Constants.WBTC,
            priceFeed: Constants.WBTC_PRICE_FEED,
            decimals: 8,
            borrowCollateralFactor: 7e17,
            liquidateCollateralFactor: 75e17,
            liquidationFactor: 93e17,
            supplyCap: 20_000e8
        });

        assetConfigs[2] = CometConfiguration.AssetConfig({
            asset: Constants.WMATIC,
            priceFeed: Constants.WMATIC_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 82e17,
            liquidateCollateralFactor: 85e17,
            liquidationFactor: 93e17,
            supplyCap: 500_000e18
        });

        assetConfigs[3] = CometConfiguration.AssetConfig({
            asset: Constants.DAI,
            priceFeed: Constants.DAI_PRICE_FEED,
            decimals: 18,
            borrowCollateralFactor: 79e17,
            liquidateCollateralFactor: 79e17,
            liquidationFactor: 93e17,
            supplyCap: 1_000_000e18
        });

        vm.broadcast(deployerPrivateKey);
        comet mumbaiCometImpl = new Comet(CometConfiguration.Configuration(
            {
                governor: deployerPrivateKey,
                pauseGuardian: deployerPrivateKey,
                baseToken: Constants.USDC,
                baseTokenPriceFeed: Constants.USDC_PRICE_FEED,
                extensionDelegate: mumbaiCometExt,
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
                baseTrackingSupplySpeed: 11574074074074e9,
                baseTrackingBorrowSpeed: 1145833333333333e12,
                baseMinForRewards: 10000e6,
                baseBorrowMin: 100e6,
                targetReserves: 5000000e6,
                assetConfigs: assetConfigs
            }
        ));
        vm.stopBroadcast();

        vm.broadcast(deployerPrivateKey);
        TransparentUpgradeableProxy mumbaiCometProxy = new TransparentUpgradeableProxy(
            mumbaiCometImpl,
            deployerPrivateKey,
            []
        );
        vm.stopBroadcast();
    }
}
