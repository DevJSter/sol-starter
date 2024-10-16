contract AcceleratedVesting {
    struct VestingSchedule {
        uint256 totalAmount;
        uint256 startTime;
        uint256 cliffDuration;
        uint256 duration;
        uint256 released;
        bool accelerated;
    }
    
    mapping(address => VestingSchedule) public vestingSchedules;
    
    function accelerateVesting(address beneficiary) external {
        VestingSchedule storage schedule = vestingSchedules[beneficiary];
        require(!schedule.accelerated, "Already accelerated");
        require(block.timestamp >= schedule.startTime + schedule.cliffDuration, "Cliff not reached");
        
        schedule.accelerated = true;
        schedule.duration = block.timestamp - schedule.startTime;
    }
}