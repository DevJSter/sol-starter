// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Person {
    string private name;

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }
}
