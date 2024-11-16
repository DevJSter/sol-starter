// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserBalance {
    mapping(address => uint256) private balances;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
