contract DisputablePredictionMarket {
    struct Market {
        bytes32 question;
        uint256 totalStaked;
        uint256 resolutionTime;
        bool resolved;
        uint8 outcome;
        uint256 disputePeriod;
        mapping(uint8 => uint256) outcomeStakes;
        mapping(address => mapping(uint8 => uint256)) userStakes;
    }
    
    struct Dispute {
        address disputer;
        uint8 proposedOutcome;
        uint256 stake;
        uint256 supportStake;
        uint256 oppositionStake;
        bool resolved;
    }
    
    mapping(bytes32 => Market) public markets;
    mapping(bytes32 => Dispute) public disputes;
    
    function createDispute(bytes32 marketId, uint8 proposedOutcome) external payable {
        Market storage market = markets[marketId];
        require(market.resolved, "Market not resolved");
        require(block.timestamp <= market.resolutionTime + market.disputePeriod, "Dispute period ended");
        require(msg.value >= market.totalStaked / 10, "Insufficient dispute stake");
        
        disputes[marketId] = Dispute({
            disputer: msg.sender,
            proposedOutcome: proposedOutcome,
            stake: msg.value,
            supportStake: 0,
            oppositionStake: 0,
            resolved: false
        });
    }
}