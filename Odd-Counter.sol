// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract oddCounter {
int public count = 1;

function increment() public returns(int) {
count += 2;
return count;
}

function decrement() public returns(int) {
count -= 2;
return count;`
}

}
