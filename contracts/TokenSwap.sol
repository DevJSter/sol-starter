pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TokenSwap {
    IERC20 public token1;
    address public owner1;
    IERC20 public token2;
    address public owner2;

    constructor(
        address _token1, address _owner1,
        address _token2, address _owner2
    ) {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
    }

    function swap(uint256 amount1, uint256 amount2) public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(token1.transferFrom(owner1, owner2, amount1), "Transfer of token1 failed");
        require(token2.transferFrom(owner2, owner1, amount2), "Transfer of token2 failed");
    }
}