//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/Cryptogenysis/Smart-Contracts/blob/main/EIP4973.sol";

  contract SoulBound is ERC4973 {
    address public owner;
    uint256 public issuedTokens = 0;

        constructor() ERC4973("PassCoin", "PASS") {
            owner = msg.sender;
        }

    function burn(uint256 _tokenId)  public  override {
            require(ownerOf(_tokenId) == msg.sender || msg.sender == owner, "You cannot revoke this token my nig");
            _burn(_tokenId);
    }

    function issue(address _reciever , string calldata _uri) onlyOwner external {
        _mint(_reciever, issuedTokens,  _uri);
        issuedTokens += 1;
    }


    modifier onlyOwner() {
            require(msg.sender == owner, "Not the owner");
            _;
    }
}
