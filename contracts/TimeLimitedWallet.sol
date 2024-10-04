pragma solidity ^0.8.0;

contract TimeLock {
    address public beneficiary;
    uint256 public releaseTime;

    constructor(address _beneficiary, uint256 _releaseTime) payable {
        require(_releaseTime > block.timestamp, "Release time should be in the future");
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime, "Current time is before release time");
        payable(beneficiary).transfer(address(this).balance);
    }
}