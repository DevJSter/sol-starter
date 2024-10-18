contract ContentMonetization {
    struct Content {
        address creator;
        uint256 price;
        uint256 totalEarnings;
        mapping(address => bool) subscribers;
        mapping(address => uint256) subscriptionExpiry;
    }
    
    mapping(bytes32 => Content) public contents;
    
    function subscribe(bytes32 contentId) external payable {
        Content storage content = contents[contentId];
        require(msg.value >= content.price, "Insufficient payment");
        
        content.subscribers[msg.sender] = true;
        content.subscriptionExpiry[msg.sender] = block.timestamp + 30 days;
        content.totalEarnings += msg.value;
        
        payable(content.creator).transfer(msg.value);
    }
}