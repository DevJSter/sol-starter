contract PortfolioRebalancer {
    struct Portfolio {
        mapping(address => uint256) targetAllocations;
        mapping(address => uint256) currentAllocations;
        uint256 lastRebalanceTime;
        uint256 rebalanceThreshold;
    }
    
    mapping(address => Portfolio) public portfolios;
    
    function rebalance(address owner) external {
        Portfolio storage portfolio = portfolios[owner];
        require(shouldRebalance(portfolio), "Rebalance not needed");
        
        // Calculate total value and current allocations
        uint256 totalValue = calculateTotalValue(portfolio);
        address[] memory tokens = getPortfolioTokens(owner);
        
        for(uint i = 0; i < tokens.length; i++) {
            uint256 targetValue = (totalValue * portfolio.targetAllocations[tokens[i]]) / 100;
            uint256 currentValue = portfolio.currentAllocations[tokens[i]];
            
            if(currentValue > targetValue) {
                // Sell excess
                executeTrade(tokens[i], targetValue, currentValue);
            } else if(currentValue < targetValue) {
                // Buy more
                executeTrade(tokens[i], currentValue, targetValue);
            }
        }
    }
}