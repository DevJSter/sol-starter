contract DynamicNFT {
    struct TokenMetadata {
        uint256 lastUpdateTime;
        uint256 level;
        uint256 experience;
        string baseURI;
    }
    
    mapping(uint256 => TokenMetadata) public tokenMetadata;
    
    function evolve(uint256 tokenId) external {
        TokenMetadata storage metadata = tokenMetadata[tokenId];
        uint256 timePassed = block.timestamp - metadata.lastUpdateTime;
        uint256 newExperience = metadata.experience + (timePassed / 1 days);
        
        if(newExperience >= 100 * (metadata.level + 1)) {
            metadata.level += 1;
            metadata.baseURI = string(abi.encodePacked("level", metadata.level.toString()));
        }
        
        metadata.experience = newExperience;
        metadata.lastUpdateTime = block.timestamp;
    }
}
