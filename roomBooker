//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0.0;

import '@openzeppelin/contracts/access/Ownable.sol';

contract BookRoom is Ownable{
    enum _is {
        Vacant,
        Occupied
    }
    _is public currentStatus;

    event hasBeenOccupied(address _occupent , uint _value);

    modifier onlyWhileVacant {
        require(currentStatus == _is.Vacant, "Currently Occupied Srry :[");
            _;
    }

    modifier fee(uint _amount) {
        require(msg.value >= _amount, "Not enough ether. Plz pay the proper amount" );
        _;
    }


     address payable manager;


    constructor()  {
        manager = payable(msg.sender);
        currentStatus = _is.Vacant;
    }

    function book() public payable onlyWhileVacant fee(1 ether) {
        /* This require check can be used instead of modifier
         require(currentStatus == _is.Vacant, "Currently Occupied Srry :["); */
         
        currentStatus = _is.Occupied;
       (bool sent, bytes memory data) = manager.call{value: msg.value}("");
        require(sent);

        emit hasBeenOccupied(msg.sender, msg.value);

    }

    function checkout() external onlyOwner {
  currentStatus = _is.Vacant;
  }
}
