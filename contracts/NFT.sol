// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {


    using Counters for Counters.Counter;

    //automatically increment _tokenIds which will assign unique Id to individual NFTs
    Counters.Counter private _tokenIds;

    address contractAddress;
    

    //when we deploy this contarct, we need to set the address of the actual marketplace
    constructor(address marketplaceAddress) ERC721("Metaverse Tokens","METT") {
    contractAddress=marketplaceAddress;
    
    }

    //function for minting new tokens
   function createToken(string memory tokenURI) public returns(uint){

    
       _tokenIds.increment();
       uint256 newItemId=_tokenIds.current();


       _mint(msg.sender,newItemId); 
       _setTokenURI(newItemId,tokenURI);

       
       setApprovalForAll(contractAddress,true);
       return newItemId;
       
   } 
}