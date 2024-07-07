// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "./SimpleStorage.sol";   

contract ExtraStorage  is SimpleStorage{
    // +5 to any number we give it
    //override
    // virtual override

    function store(uint256 _favriteNumber) public  override {
        favoriteNumber = _favriteNumber +5;

    }
    
}