const SHA256 = require('crypto-js/sha256');

class Block {
    constructor(data) {
        this.data = data || 'default data'; // Example data
    }

    toHash() {
        // Generate a hash from the block's data
        return SHA256(this.data).toString();
    }
}

module.exports = Block;
