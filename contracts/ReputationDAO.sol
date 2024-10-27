contract ReputationDAO {
    struct Member {
        uint256 reputation;
        uint256 lastActionTime;
        uint256 proposalsCreated;
        uint256 votesParticipated;
    }
    
    mapping(address => Member) public members;
    
    function adjustReputation(address member, bool positive) internal {
        Member storage m = members[member];
        if(positive) {
            m.reputation += calculateReputationGain(m);
        } else {
            m.reputation -= calculateReputationLoss(m);
        }
        m.lastActionTime = block.timestamp;
    }
    
    function calculateReputationGain(Member memory m) internal pure returns (uint256) {
        return 10 + (m.proposalsCreated * 2) + (m.votesParticipated);
    }
    
    function calculateReputationLoss(Member memory m) internal pure returns (uint256) {
        return 5 + (m.reputation / 10);
    }
}
