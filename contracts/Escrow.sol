pragma solidity ^0.8.0;

contract Escrow {
    address public payer;
    address payable public payee;
    address public arbiter;
    uint public amount;

    constructor(address _payer, address payable _payee, address _arbiter) payable {
        payer = _payer;
        payee = _payee;
        arbiter = _arbiter;
        amount = msg.value;
    }

    function release() public {
        require(msg.sender == arbiter);
        payee.transfer(amount);
    }

    function refund() public {
        require(msg.sender == arbiter);
        payable(payer).transfer(amount);
    }
}