// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;

    constructor() {
        owner = msg.sender;
    }

    function addCandidates(string[] memory names) public {
        require(msg.sender == owner, "Only owner can add candidates");
        for (uint i = 0; i < names.length; i++) {
            candidates.push(Candidate(names[i], 0));
        }
    }

    function vote(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId < candidates.length, "Invalid candidate");

        candidates[candidateId].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getVotes(uint256 candidateId) public view returns (uint256) {
        require(candidateId < candidates.length, "Invalid candidate");
        return candidates[candidateId].voteCount;
    }
}
