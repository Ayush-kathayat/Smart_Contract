# VoterSystem Smart Contract

This Solidity program is a simple smart contract that implements a basic voting system. It demonstrates the usage of control flow statements like `require`, `assert`, and `delete` to validate voter eligibility, manage candidate data, and handle voting operations.

## Description

This smart contract is written in Solidity, a programming language used for creating smart contracts on the Ethereum blockchain. The contract consists of the following functions:

- `vote`: Allows a voter to cast their vote for a specific candidate. It verifies that the voter meets the minimum age requirement, hasn't voted before, and selects a valid candidate.

- `addCandidate`: Adds a new candidate to the voting system. It ensures that the candidate doesn't already exist.

- `deleteCandidate`: Removes a candidate from the voting system. It checks if the candidate exists and has no votes before deletion.

## Getting Started

### Prerequisites

To interact with this smart contract, you'll need an Ethereum development environment, such as Remix IDE.

### Execution

To run this program, follow these steps:

1. Open the Remix IDE by visiting https://remix.ethereum.org/.
2. Create a new file in the IDE and save it with a `.sol` extension (e.g., `VoterSystem.sol`).

 
 ```
   // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This is a simple Smart Contract to demonstrate the control flow statements present in Solidity
// It simulates a Voting System

contract VoterSystem {
    uint public votingAge = 18; // Minimum age required for a voter

    // Mapping to track whether an address has voted or not
    mapping(address => bool) public hasVoted;

    // Mapping to store the number of votes received by each candidate
    mapping(address => uint) public candidateVotes;

    // Mapping to track valid candidates
    mapping(address => bool) public isCandidate;


    // Function for a voter to cast their vote
    function vote(address _candidate, uint age) external {

        // Check if the voter meets the minimum age requirement

        if(age < votingAge)
        {
            revert("Voter must be at least 18 years old.");
        }
       
        // Check if the voter has not already voted
        assert(!hasVoted[msg.sender]);

        // Check if the candidate is valid
        require(isCandidate[_candidate], "Invalid candidate.");

        // Increment the vote count for the selected candidate
        candidateVotes[_candidate]++;

        // Mark the voter as having voted
        hasVoted[msg.sender] = true;
    }

    // Function to add a candidate to the system
    function addCandidate(address _candidate) external {
        // Check if the candidate doesn't already exist
        require(!isCandidate[_candidate], "Candidate already exists.");

        // Add the candidate to the system
        isCandidate[_candidate] = true;
    }

    // Function to delete a candidate from the system
    function deleteCandidate(address _candidate) external {
        // Check if the candidate exists
        require(isCandidate[_candidate], "Candidate does not exist.");

        // Check if the candidate has no votes before deleting
        require(candidateVotes[_candidate] == 0, "Cannot delete candidate with votes.");

        // Delete the candidate from the system
        delete isCandidate[_candidate];
    }
}
```

3. Copy and paste the provided code snippet into the file.
4. Compile the code by selecting the "Solidity Compiler" tab, ensuring the compiler version is set to `0.8.0`, and clicking on "Compile VoterSystem.sol".
5. Deploy the smart contract by switching to the "Deploy & Run Transactions" tab and clicking on "Deploy" (ensure you have the appropriate network selected).
6. Interact with the contract by calling its functions, such as `vote`, `addCandidate`, and `deleteCandidate`.

## Authors

[Ayush Kathayat](https://github.com/Ayush-kathayat)

## License

This project is licensed under the MIT License. See the [LICENSE.md](https://license.md/)https://license.md/) file for details.
