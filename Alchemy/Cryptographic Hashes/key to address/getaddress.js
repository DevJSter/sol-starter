const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
    // Remove the first byte (format byte) from the public key
    const publicKeyWithoutFormat = publicKey.slice(1);

    // Hash the public key using keccak256
    const hash = keccak256(publicKeyWithoutFormat);

    // Return the last 20 bytes of the hash (Ethereum address)
    return hash.slice(-20);
}

module.exports = getAddress;
