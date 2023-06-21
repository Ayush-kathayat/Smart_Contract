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
