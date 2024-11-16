// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityExample {
    function internalFunction() internal pure returns (string memory) {
        return "Internal Function Called";
    }

    function externalFunction() external pure returns (string memory) {
        return internalFunction();
    }
}