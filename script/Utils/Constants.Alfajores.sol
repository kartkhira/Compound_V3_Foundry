//SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

/// Goerli Testnet Address
library Constants {

    //Metadata CID 
    // CID generated on Test Images for Euphoriv Chee. Refer To Pinata
    string public constant baseURI ="ipfs://QmaR1eavM6m4fHaT4bFVNGiyuqc1Wojf2E3BtAWUXFrgfY/"; 
    //Hidden Metadata CID
    // CID generated on Test Hidden Image for Euphoriv Chee. Refer To Pinata
    string public constant notRevealedURI = "ipfs://QmVQCZx62FBnKrfSSJ3Luz2dCRDayJZqQnuSxCiFughExA/"; 
    bytes32 public constant merkleRoot =0x215e04ba15ebcb1cca84ac39fd1445c74bed0b1c93f9c770ded7eec5fb99849d;

}