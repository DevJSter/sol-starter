const SHA256 = require('crypto-js/sha256');

class Block {
    constructor(data) {
        this.data = data;
    }

    toHash() {
        return SHA256(this.data).toString();
    }
}

module.exports = Block;


class Blockchain {
    constructor() {
        // Create the genesis block and add it to the chain
        this.chain = [new Block('Genesis Block')];
    }
}

module.exports = Blockchain;
