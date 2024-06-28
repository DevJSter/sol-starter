// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract SimpleStorage {
    // Solidity basic data types: boolean, uint, int, address, bytes

    bool hasFavoriteNumber = true;
    uint256 favoriteNumber = 123; // uint16, uint32, uint64, uint128 can also be used, but it is good practice to be explicit in Solidity
    string favoriteNumberInText = "Five";
    int256 num = -5;
    address myAddress = 0x4D088Fe37422199dEAA6bc32FD7514b35C175908;
    bytes32 favoriteBytes = 0x6361740000000000000000000000000000000000000000000000000000000000; // bytes can also be used, but it is good practice to be explicit in Solidity

    uint256  favoriteNumberStored;
    
    //mappings
    mapping(string => uint256) public nameFavoriteNumber;


    People public person = People(2 ,"Shubham");

    struct People {
        uint256 favoriteNumber;
        string name;
    } 

    People[] public people;


    function store(uint256 _favoriteNumber) public {
        favoriteNumberStored = _favoriteNumber;
    }

    // Calling View Function costs nothing but if we call it inside a function which need gas fees then the view functions also causes extra gas fees
    // View, pure keywords allow and we do not need to spend any gas fees ;
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        People memory newPerson = People({favoriteNumber:_favoriteNumber,name:_name});
        people.push(newPerson);
        nameFavoriteNumber[_name] = _favoriteNumber;
    }
    // EVM
    // Stack Memory Storage Calldata 

    //calldata, memory and storage 
    // Arrays, Strings , mappings and structs insolidity requires to be defined with either calldata or memory

}