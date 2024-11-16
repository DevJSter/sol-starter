// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnly {

    modifier onlyOwner(){
       _;
    }

    function protectedFunction() public view onlyOwner returns (string memory) {

    }
}