const SHA256 = require('crypto-js/sha256');

class Block {
    constructor(data, previousHash = '') {
        this.data = data;
        this.previousHash = previousHash; // Add previousHash
    }

    toHash() {
        // Hash the combination of previousHash and data
        return SHA256(this.previousHash + this.data).toString();
    }
}

module.exports = Block;
