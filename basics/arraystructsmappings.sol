// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Array {
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listofPeople; // but what about if we have a thousand number of perople in this listofpeople 

    // we use mapping for that

    mapping( string => uint256) public nameToFavoriteNumber;

    function add(uint256 _favoriteNumber, string memory _name) public {
        listofPeople.push(Person(_favoriteNumber,_name));
        nameToFavoriteNumber[_name] = _favoriteNumber; // in this we create it like if the person you searching for is in the array then this mapping will map their name to their favoritenumber
    }
}