class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.transaction = { inputUTXOs, outputUTXOs };
    }

    execute() {
        // Check for double spend
        const isDoubleSpend = this.transaction.inputUTXOs.findIndex(utxo => utxo.spent === true);
        if (isDoubleSpend !== -1) {
            throw new Error('Exist transaction that already was spent');
        }

        // Calculate total input and output values
        const totalInputValue = this.transaction.inputUTXOs.reduce((acc, utxo) => acc + utxo.amount, 0);
        const totalOutputValue = this.transaction.outputUTXOs.reduce((acc, utxo) => acc + utxo.amount, 0);

        // Check for insufficient UTXO funds
        if (totalInputValue < totalOutputValue) {
            throw new Error('Insufficient UTXO funds');
        }

        // Mark input UTXOs as spent
        this.transaction.inputUTXOs.forEach(utxo => utxo.spent = true);
    }
}

module.exports = Transaction;
