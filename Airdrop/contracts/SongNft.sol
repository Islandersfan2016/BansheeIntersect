// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


//Royality contract for Banshee example
contract SongNft is ERC721Royalty, Ownable {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;

  constructor() ERC721("BSH", "Banshee") {

  }

  function mint() external payable {
    require(_tokenIdCounter.current() < 100, "You can mint anymore!");
    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
		
    _safeMint(msg.sender, tokenId);
  }
		
  function setDefaultRoyalty(address receiver, uint96 fee) external onlyowner{
    _setDefaultRoyalty(receiver, fee);
  }
		
  function _baseURI() internal pure override returns (string memory) {
    return " https://gateway.pinata.cloud/ipfs/QmZuNAwmVZdh9f9p774uhKxXFWZ6Kc1BLim4Hm8Jxnr8XU";
  }
		
  function Withdraw_funds() external onlyOwner {
    payable(owner()).transfer(address(this).balance);
  }
}
