contract LiquidDemocracy {
    struct Voter {
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }
    
    struct Proposal {
        bytes32 name;
        uint voteCount;
        uint startTime;
        uint endTime;
    }
    
    mapping(address => Voter) public voters;
    Proposal[] public proposals;
    
    function delegate(address to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Already voted");
        require(to != msg.sender, "Self-delegation not allowed");
        
        while (voters[to].delegate != address(0)) {
            to = voters[to].delegate;
            require(to != msg.sender, "Found loop in delegation");
        }
        sender.voted = true;
        sender.delegate = to;
        Voter storage delegate_ = voters[to];
        if (delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }
    }
}