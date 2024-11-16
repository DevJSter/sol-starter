// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusContract {

    enum Status {  }

    modifier onlyOwner(){
        _;
    }

    function activate() external onlyOwner {

    }

    function complete() external onlyOwner {

    }

    function fundContract() external payable {
    
    }

    function _getStatus() internal view returns (Status) {
    
    }

    function isComplete() external view returns (bool) {
        
    }
}