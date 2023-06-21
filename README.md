# SmartContract

This Solidity program is a simple smart contract that demonstrates basic functionality for managing a balance. The purpose of this program is to showcase the usage of Solidity's require(), assert(), and revert() functions for input validation and transaction handling.

## Description

This program is a contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes two functions: `deposit` and `Revert`. 

The `deposit` function allows users to deposit a specified amount into the contract's balance. It includes input validation using the `require()` function to check if the amount is greater than zero and if the balance after the deposit will exceed the maximum balance allowed. The function updates the balance and uses the `assert()` function to ensure the balance stays within the maximum limit.

The `Revert` function demonstrates the use of the `revert()` function to explicitly revert a transaction. When called, the function will revert the transaction and provide a custom error message.

This program can be used as a starting point for understanding input validation and transaction handling in Solidity smart contracts.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. Follow the steps below:

1. Go to the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SmartContract.sol).
3. Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContract {
    uint public balance;
    uint public maxBalance = 100;

    function deposit(uint amount) external {
        // Use require() to validate input conditions
        require(amount > 0, "Amount must be greater than zero");
        require(balance + amount <= maxBalance, "Exceeds maximum balance");

        // Update the balance
        balance += amount;

        // Use assert() to validate internal conditions
        assert(balance <= maxBalance);
    }

    function Revert() external pure {
        // Use revert() to explicitly revert the transaction
        revert("Explicitly reverting the transaction");
    }
}
```

4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile SmartContract.sol" button.

5. Once the code is compiled, you can interact with the contract by deploying and calling its functions.

## Authors

Metacrafter Chris\
[@metacraftersio](https://github.com/metacraftersio)

## License

This project is licensed under the MIT License. See the [LICENSE.md](https://license.md/) file for details.
