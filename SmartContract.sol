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
