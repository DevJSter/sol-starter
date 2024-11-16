# StatusContract Project

This project contains a Solidity smart contract called `StatusContract`, which demonstrates various Solidity concepts like enums, events, modifiers, internal and external functions, and payable functions. 

## Contract Overview

The `StatusContract` contract manages a workflow status using an enum with states:
- `Pending`
- `Active`
- `Completed`

### Features
1. **Enum Status**: Manages the current state of the contract.
2. **Modifiers**: Allows only the contract owner to activate or complete the contract.
3. **Event**: Emits a `StatusChanged` event whenever the contract status changes.
4. **Payable Function**: Allows users to fund the contract.
5. **Internal and External Functions**: Demonstrates visibility scopes.
6. **Constructor**: Should set the owner to sender, currentStatus to pending and currentBalance to value.

## Contract Functions

- `activate()`: Activates the contract (only accessible by the owner).
- `complete()`: Completes the contract (only if already activated and by the owner).
- `fundContract()`: Allows funding of the contract. Value should be larger than 0.
- `isComplete()`: Checks if the contract is complete.
- `_getStatus()`: Internal function to retrieve the current status (demonstrates internal visibility).
