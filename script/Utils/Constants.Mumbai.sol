//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// Goerli Testnet Address
library Constants {

    address constant USDC = 0xe6b8a5CF854791412c1f6EFC7CAf629f5Df1c747;
    address constant WETH9 = 0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619;
    address constant WBTC = 0x2260fac5e5542a773aa44fbcfedf7c193bc2c599;
    address constant WMATIC = 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270;
    address constant DAI = 0x6b175474e89094c44da98b954eedeac495271d0f;

    address constant USDC_PRICE_FEED = 0x572dDec9087154dC5dfBB1546Bb62713147e0Ab0;
    address constant WETH9_PRICE_FEED = 0x0715A7794a1dc8e42615F059dD6e406A6594651A;
    address constant WBTC_PRICE_FEED = 0x007A22900a3B98143368Bd5906f8E17e9867581b;
    address constant WMATIC_PRICE_FEED = 0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada;
    address constant DAI_PRICE_FEED = 0x0FCAa9c899EC5A91eBc3D5Dd869De833b06fB046;

    //Making Reward Token as USDC for now
    address constant REWARD_TOKEN = USDC ;
}