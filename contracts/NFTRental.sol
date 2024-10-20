contract NFTRental {
    struct Rental {
        address lender;
        address renter;
        uint256 tokenId;
        uint256 duration;
        uint256 price;
        bool active;
    }
    
    mapping(uint256 => Rental) public rentals;
    mapping(uint256 => bool) public isRented;
    
    event RentalCreated(uint256 tokenId, address lender, uint256 price);
    event RentalActivated(uint256 tokenId, address renter);
    
    function createRental(uint256 tokenId, uint256 duration, uint256 price) external {
        require(!isRented[tokenId], "Already rented");
        rentals[tokenId] = Rental(msg.sender, address(0), tokenId, duration, price, false);
        emit RentalCreated(tokenId, msg.sender, price);
    }
}
