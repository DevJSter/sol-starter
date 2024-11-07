### ERC 20

ERC 20 is a standard for creating fungible tokens on the Ethereum blockchain. Fungible tokens are interchangeable and identical to each other, making them suitable for currencies, reward points, and other similar applications.

**Key Features of ERC 20:**
1. **Standardized Functions:** Ensures that all tokens implementing this standard can interact with each other.
2. **Interoperability:** Allows tokens to be used in various decentralized applications (dApps) and exchanges.
3. **Basic Functions:** Includes essential functions such as transferring tokens, checking balances, and approving tokens for spending by other accounts.

**Required Functions:**
- `totalSupply`: Returns the total supply of the token.
- `balanceOf`: Returns the balance of a specific address.
- `transfer`: Transfers tokens from the caller’s address to another address.
- `transferFrom`: Transfers tokens from one address to another (usually used for allowances).
- `approve`: Allows another address to spend a certain amount of tokens on behalf of the caller.
- `allowance`: Returns the remaining number of tokens that an address is allowed to spend on behalf of another address.

Here's a basic example of an ERC 20 contract in Solidity:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("My Token", "MTK") {
        _mint(msg.sender, initialSupply);
    }
}
```

In this example:
- The `constructor` function mints an initial supply of tokens to the deployer's address.
- The contract inherits from OpenZeppelin's ERC 20 implementation, which provides the necessary functions and security features.

### ERC 721

As previously mentioned, ERC 721 is a standard for non-fungible tokens (NFTs) on the Ethereum blockchain. NFTs are unique and distinct, making them suitable for representing ownership of assets like art, collectibles, real estate, and more.

**Key Features of ERC 721:**
1. **Uniqueness:** Each token has a unique identifier.
2. **Ownership:** Each token is owned by a single account.
3. **Transferability:** Tokens can be transferred between accounts.
4. **Metadata:** Tokens can have metadata associated with them, such as a URL pointing to a digital artwork.
5. **Interoperability:** ERC 721 tokens can be used in various decentralized applications (dApps) that support the standard.

Here's a basic example of an ERC 721 contract in Solidity:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 public nextTokenId;
    address public admin;

    constructor() ERC721('My NFT', 'MNFT') {
        admin = msg.sender;
    }

    function mint(address to) external {
        require(msg.sender == admin, 'only admin can mint');
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return "https://my-nft-metadata-url.com/token/";
    }
}
```

In this example:
- The `mint` function allows the admin to create new tokens.
- The `_baseURI` function defines a base URL for token metadata.

**Summary:**
- **ERC 20** is for creating fungible tokens, which are identical and can be used for things like currencies and reward points.
- **ERC 721** is for creating non-fungible tokens, which are unique and used for things like digital art and collectibles.