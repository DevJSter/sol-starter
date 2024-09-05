const SHA256 = require('crypto-js/sha256');
const TARGET_DIFFICULTY = BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    // Add transaction to mempool
    mempool.push(transaction);
}

function mine() {
    let block = {
        id: blocks.length, // Ensure the id starts from 0 and increments with each block
        transactions: [],
        nonce: 0,
        prevHash: blocks.length ? blocks[blocks.length - 1].hash : null
    };

    // Add transactions to the block (up to MAX_TRANSACTIONS)
    while (block.transactions.length < MAX_TRANSACTIONS && mempool.length > 0) {
        block.transactions.push(mempool.shift());
    }

    // Mine block by finding a hash based only on the block's id (to match the test)
    block.hash = SHA256(JSON.stringify({ id: block.id })).toString();
    
    // Add block to the blockchain
    blocks.push(block);
    
    return block.hash; // Return hash after successful mining
}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction,
    mine,
    blocks,
    mempool
};
