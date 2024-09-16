// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    struct Voter {
        bool hasVoted;
        uint vote;
        bool isRegistered;
    }

    address public owner;
    mapping(uint => Candidate) public candidates;
    mapping(address => Voter) public voters;
    uint public candidatesCount;
    uint public votersCount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory _name) public onlyOwner {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function registerVoter(address _voter) public onlyOwner {
        votersCount++;
        voters[_voter].isRegistered = true;
    }

    function vote(uint _candidateId) public {
        require(voters[msg.sender].isRegistered, "Voter is not registered");
        require(!voters[msg.sender].hasVoted, "Voter has already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");

        voters[msg.sender].hasVoted = true;
        voters[msg.sender].vote = _candidateId;
        candidates[_candidateId].voteCount++;
    }

    function getCandidate(uint _candidateId) public view returns (string memory, uint) {
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }
}
