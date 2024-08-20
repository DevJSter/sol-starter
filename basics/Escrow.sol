// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for the escrow contract
interface IEscrow {
    function deposit() external payable;
    function release() external;
    function refund() external;
}

// Base contract that handles ownership
contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }
}

// Escrow contract that inherits Ownable and implements IEscrow
contract Escrow is Ownable, IEscrow {
    // Parties involved in the escrow
    address public buyer;
    address public seller;

    // State variable to track the escrow balance
    uint256 public escrowBalance;

    // Modifier to check if the caller is the buyer
    modifier onlyBuyer() {
        require(msg.sender == buyer, "Caller is not the buyer");
        _;
    }

    // Events to emit when funds are deposited, released, or refunded
    event FundsDeposited(address indexed buyer, uint256 amount);
    event FundsReleased(address indexed seller, uint256 amount);
    event FundsRefunded(address indexed buyer, uint256 amount);

    // Constructor to initialize buyer and seller
    constructor(address _buyer, address _seller) {
        require(_buyer != address(0) && _seller != address(0), "Invalid buyer or seller address");
        buyer = _buyer;
        seller = _seller;
    }

    // Function to deposit funds into the escrow (only buyer)
    function deposit() external payable override onlyBuyer {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        escrowBalance += msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    // Function to release funds to the seller (only owner)
    function release() external override onlyOwner {
        require(escrowBalance > 0, "No funds to release");
        uint256 amount = escrowBalance;
        escrowBalance = 0;
        payable(seller).transfer(amount);
        emit FundsReleased(seller, amount);
    }

    // Function to refund the buyer (only owner)
    function refund() external override onlyOwner {
        require(escrowBalance > 0, "No funds to refund");
        uint256 amount = escrowBalance;
        escrowBalance = 0;
        payable(buyer).transfer(amount);
        emit FundsRefunded(buyer, amount);
    }

    // Fallback function to accept Ether directly
    fallback() external payable {
        escrowBalance += msg.value;
    }

    // Receive function to accept Ether directly
    receive() external payable {
        escrowBalance += msg.value;
    }
}
