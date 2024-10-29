contract GamifiedYieldFarm {
    struct Farmer {
        uint256 stakedAmount;
        uint256 lastHarvestTime;
        uint256 level;
        uint256 experience;
        uint256[] achievements;
    }
    
    mapping(address => Farmer) public farmers;
    
    function harvest() external {
        Farmer storage farmer = farmers[msg.sender];
        require(farmer.stakedAmount > 0, "Nothing staked");
        
        uint256 timePassed = block.timestamp - farmer.lastHarvestTime;
        uint256 baseYield = calculateBaseYield(farmer.stakedAmount, timePassed);
        uint256 bonus = calculateLevelBonus(farmer.level);
        
        uint256 totalReward = baseYield + ((baseYield * bonus) / 100);
        farmer.experience += totalReward / 1e18;
        
        if(farmer.experience >= 100 * (farmer.level + 1)) {
            farmer.level += 1;
            checkAchievements(farmer);
        }
        
        farmer.lastHarvestTime = block.timestamp;
    }
}
