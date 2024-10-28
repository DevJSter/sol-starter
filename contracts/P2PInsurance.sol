contract P2PInsurance {
    struct Policy {
        address policyholder;
        uint256 coverage;
        uint256 premium;
        uint256 startTime;
        uint256 duration;
        bool active;
        mapping(address => uint256) underwriters;
    }
    
    mapping(uint256 => Policy) public policies;
    
    function underwritePolicy(uint256 policyId, uint256 amount) external payable {
        Policy storage policy = policies[policyId];
        require(policy.active, "Policy not active");
        require(msg.value >= amount, "Insufficient funds");
        
        policy.underwriters[msg.sender] = amount;
    }
}
