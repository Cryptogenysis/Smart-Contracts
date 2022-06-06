 // SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract EvenCounter {
int public count = 0;

function increment() public returns(int) {
count += 2;
return count;
}

function decrement() public returns(int) {
count -=2;
return count;
}

}
