contract DynamicFeeAMM {
    uint public constant PRECISION = 1e18;
    uint public baseRate = 3e15; // 0.3%
    uint public volatilityMultiplier = 2;
    
    struct Pool {
        uint reserve0;
        uint reserve1;
        uint lastTradeTime;
        uint volatility;
    }
    
    mapping(bytes32 => Pool) public pools;
    
    function calculateFee(bytes32 poolId, uint amount) public view returns (uint) {
        Pool storage pool = pools[poolId];
        uint timeSinceLastTrade = block.timestamp - pool.lastTradeTime;
        uint adjustedRate = baseRate * (PRECISION + (pool.volatility * volatilityMultiplier)) / PRECISION;
        
        if(timeSinceLastTrade < 1 hours) {
            adjustedRate = adjustedRate * 2;
        }
        
        return amount * adjustedRate / PRECISION;
    }