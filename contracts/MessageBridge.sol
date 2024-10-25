contract MessageBridge {
    struct Message {
        uint256 nonce;
        address sender;
        uint256 sourceChainId;
        uint256 targetChainId;
        bytes payload;
        bool executed;
    }
    
    mapping(bytes32 => Message) public messages;
    mapping(uint256 => uint256) public chainNonces;
    
    event MessageSent(bytes32 indexed messageId, address sender, uint256 targetChainId);
    event MessageReceived(bytes32 indexed messageId, address sender, bytes payload);
    
    function sendMessage(uint256 targetChainId, bytes memory payload) external {
        bytes32 messageId = keccak256(abi.encodePacked(
            block.chainid,
            chainNonces[block.chainid]++,
            msg.sender,
            targetChainId,
            payload
        ));
        
        messages[messageId] = Message(
            chainNonces[block.chainid],
            msg.sender,
            block.chainid,
            targetChainId,
            payload,
            false
        );
        
        emit MessageSent(messageId, msg.sender, targetChainId);
    }
}
