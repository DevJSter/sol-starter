// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusContract {
    enum Status { Pending, Active, Completed }
    Status public currentStatus;

    address payable public owner;
    uint256 public contractBalance;

    event StatusChanged(Status newStatus);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor() payable {
        owner = payable(msg.sender);
        currentStatus = Status.Pending;
        contractBalance = msg.value;
    }

    function activate() external onlyOwner {
        currentStatus = Status.Active;
        emit StatusChanged(currentStatus);
    }

    function complete() external onlyOwner {
        require(currentStatus == Status.Active, "Must be Active to complete");
        currentStatus = Status.Completed;
        emit StatusChanged(currentStatus);
    }

    function fundContract() external payable {
        require(msg.value > 0, "Must send some ether");
        contractBalance += msg.value;
    }

    function _getStatus() internal view returns (Status) {
        return currentStatus;
    }

    function isComplete() external view returns (bool) {
        return currentStatus == Status.Completed;
    }
}