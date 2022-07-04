//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/Cryptogenysis/Smart-Contracts/blob/main/EIP4973.sol";

  contract ABT is ERC4973 {
    address payable owner;
    uint256 public issuedTokens = 0;

        constructor() ERC4973("VeriCoin","Veri") {
            owner = payable(msg.sender);
        }

    function burn(uint256 _tokenId)  public  override {
            require(ownerOf(_tokenId) == msg.sender || msg.sender == owner, "You cannot revoke this token because it does not belong to you.");
            _burn(_tokenId);
    }

    function issue(address _reciever , string calldata _uri) onlyOwner external {
        _mint(_reciever, issuedTokens,  _uri);
        issuedTokens += 1;
    }

    function purchasePass(address _reciever , string calldata _uri) external payable fee(1 ether) {
         (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);
        
        
        _mint(_reciever, issuedTokens,  _uri);
        issuedTokens += 1;
    }


    modifier onlyOwner() {
            require(msg.sender == owner, "Only owner may authorize this transaction");
            _;
    }
    
     modifier fee(uint _amount) {
        require(msg.value >= _amount, "Insufficiant Funds. Plz pay the proper amount of 1 ETH" );
        _;
}
  }
