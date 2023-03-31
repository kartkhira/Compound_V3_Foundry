
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../src/CometConfiguration.sol";


CometConfiguration.Configuration constant configMumbai = CometConfiguration.Configuration({
    address: "Compound USDC",
    pauseGuardian: "cUSDCv3",
    baseToken: "USDC",
    baseTokenPriceFeed: 0x572dDec9087154dC5dfBB1546Bb62713147e0Ab0,
    borrowMin: 100e6,
    storeFrontPriceFactor: 5e17,
    targetReserves: 5000000e6,
    rates: Rates({
        supplyKink: 8e17,
        supplySlopeLow: 325e16,
        supplySlopeHigh: 4e17,
        supplyBase: 0,
        borrowKink: 8e17,
        borrowSlopeLow: 35e16,
        borrowSlopeHigh: 25e17,
        borrowBase: 15e16
    }),
    tracking: Tracking({
        indexScale: 1e15,
        baseSupplySpeed: 11574074074074e9,
        baseBorrowSpeed: 1145833333333333e12,
        baseMinForRewards: 10000e6
    }),
    assetConfigs: [
        AssetConfig({
            asset :0x6b175474e89094c44da98b954eedeac495271d0f,
            priceFeed: 0x0FCAa9c899EC5A91eBc3D5Dd869De833b06fB046,
            decimals: 18,
            borrowCF: 79e17,
            liquidateCF: 79e17,
            liquidationFactor: 93e17,
            supplyCap: 1_000_000e18
        }),
        AssetConfig({
            asset :0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619,
            priceFeed: 0x0715A7794a1dc8e42615F059dD6e406A6594651A,
            decimals: 18,
            borrowCF: 82e17,
            liquidateCF: 85e17,
            liquidationFactor: 93e17,
            supplyCap: 50_000e18
        }),
        AssetConfig({
            asset :0x2260fac5e5542a773aa44fbcfedf7c193bc2c599,
            priceFeed: 0x007A22900a3B98143368Bd5906f8E17e9867581b,
            decimals: 8,
            borrowCF: 7e17,
            liquidateCF: 75e17,
            liquidationFactor: 93e17,
            supplyCap: 20_000e8
        }),
        AssetConfig({
            asset :0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270,
            priceFeed: 0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada,
            decimals: 18,
            borrowCF: 82e17,
            liquidateCF: 85e17,
            liquidationFactor: 93e17,
            supplyCap: 500_000e18
        })
    ]
});


