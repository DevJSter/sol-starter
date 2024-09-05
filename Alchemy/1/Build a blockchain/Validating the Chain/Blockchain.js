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

    isValid() {
        // Loop through the chain starting from the second block
        for (let i = 1; i < this.chain.length; i++) {
            const currentBlock = this.chain[i];
            const previousBlock = this.chain[i - 1];

            // Check if the current block's previousHash matches the hash of the previous block
            if (currentBlock.previousHash !== previousBlock.toHash()) {
                return false;
            }
        }
        return true;
    }
}

module.exports = Blockchain;
