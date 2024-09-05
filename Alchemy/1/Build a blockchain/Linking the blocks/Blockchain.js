const Block = require('./Block');

class Blockchain {
    constructor() {
        // Create the genesis block and add it to the chain
        this.chain = [new Block('Genesis Block')];
    }

    addBlock(newBlock) {
        // Set the previous hash for the new block to the hash of the last block in the chain
        newBlock.previousHash = this.chain[this.chain.length - 1].toHash();
        // Add the new block to the chain
        this.chain.push(newBlock);
    }
}

module.exports = Blockchain;
