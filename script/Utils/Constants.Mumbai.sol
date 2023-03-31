//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// Goerli Testnet Address
library Constants {

    address constant USDC = 0xe6b8a5CF854791412c1f6EFC7CAf629f5Df1c747;
    address constant WETH = 0xA6FA4fB5f76172d178d61B04b0ecd319C5d1C0aa;
    address constant WBTC = 0x0d787a4a1548f673ed375445535a6c7A1EE56180;
    address constant WMATIC = 0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889;
    address constant DAI = 0xd393b1E02dA9831Ff419e22eA105aAe4c47E1253;

    address constant USDC_PRICE_FEED = 0x572dDec9087154dC5dfBB1546Bb62713147e0Ab0;
    address constant WETH_PRICE_FEED = 0x0715A7794a1dc8e42615F059dD6e406A6594651A;
    address constant WBTC_PRICE_FEED = 0x007A22900a3B98143368Bd5906f8E17e9867581b;
    address constant WMATIC_PRICE_FEED = 0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada;
    address constant DAI_PRICE_FEED = 0x0FCAa9c899EC5A91eBc3D5Dd869De833b06fB046;

    //Making Reward Token as USDC for now
    address constant REWARD_TOKEN = USDC ;
}