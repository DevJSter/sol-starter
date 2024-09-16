// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to store balances of users
    mapping(address => uint256) private balances;

    // Mapping to store whether an account has enrolled
    mapping(address => bool) private enrolled;

    // Owner of the contract
    address public owner;

    // Events to emit when a deposit or withdrawal is made
    event LogEnrolled(address indexed accountAddress);
    event LogDepositMade(address indexed accountAddress, uint256 amount);
    event LogWithdrawalMade(address indexed accountAddress, uint256 withdrawAmount, uint256 newBalance);

    // Modifier to check if the function caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Modifier to check if the account is enrolled
    modifier isEnrolled() {
        require(enrolled[msg.sender], "Account not enrolled");
        _;
    }

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to enroll an account
    function enroll() public returns (bool) {
        require(!enrolled[msg.sender], "Account already enrolled");

        enrolled[msg.sender] = true;
        emit LogEnrolled(msg.sender);
        return true;
    }

    // Function to deposit funds into the bank
    function deposit() public payable isEnrolled returns (uint256) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    // Function to withdraw funds from the bank
    function withdraw(uint256 withdrawAmount) public isEnrolled returns (uint256) {
        require(balances[msg.sender] >= withdrawAmount, "Insufficient balance");

        balances[msg.sender] -= withdrawAmount;
        payable(msg.sender).transfer(withdrawAmount);

        emit LogWithdrawalMade(msg.sender, withdrawAmount, balances[msg.sender]);
        return balances[msg.sender];
    }

    // Function to check the balance of an account
    function balance() public view isEnrolled returns (uint256) {
        return balances[msg.sender];
    }

    // Function to check if an account is enrolled
    function isAccountEnrolled(address account) public view returns (bool) {
        return enrolled[account];
    }
}
