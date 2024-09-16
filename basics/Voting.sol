// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Struct to represent a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Struct to represent a voter
    struct Voter {
        bool authorized;
        bool voted;
        uint vote;
    }

    // Mapping to store candidates by ID
    mapping(uint => Candidate) public candidates;

    // Mapping to store voters by address
    mapping(address => Voter) public voters;

    // Array to store candidate IDs
    uint[] public candidateIds;

    // Owner of the contract
    address public owner;

    // Number of candidates
    uint public totalCandidates;

    // Modifier to check if the function caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Modifier to check if a voter is authorized
    modifier isAuthorized() {
        require(voters[msg.sender].authorized, "Voter is not authorized");
        _;
    }

    // Event to emit when a new candidate is added
    event CandidateAdded(uint indexed candidateId, string name);

    // Event to emit when a vote is cast
    event VoteCast(address indexed voter, uint indexed candidateId);

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add a candidate (only owner)
    function addCandidate(string memory name) public onlyOwner {
        totalCandidates++;
        candidates[totalCandidates] = Candidate(totalCandidates, name, 0);
        candidateIds.push(totalCandidates);
        emit CandidateAdded(totalCandidates, name);
    }

    // Function to authorize a voter (only owner)
    function authorizeVoter(address voter) public onlyOwner {
        require(!voters[voter].authorized, "Voter is already authorized");
        voters[voter].authorized = true;
    }

    // Function to cast a vote (only authorized voters)
    function vote(uint candidateId) public isAuthorized {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Voter has already voted");
        require(candidateId > 0 && candidateId <= totalCandidates, "Invalid candidate ID");

        sender.voted = true;
        sender.vote = candidateId;
        candidates[candidateId].voteCount++;
        emit VoteCast(msg.sender, candidateId);
    }

    // Function to get the total number of votes for a candidate
    function getTotalVotes(uint candidateId) public view returns (uint) {
        require(candidateId > 0 && candidateId <= totalCandidates, "Invalid candidate ID");
        return candidates[candidateId].voteCount;
    }

    // Function to get all candidate IDs
    function getAllCandidateIds() public view returns (uint[] memory) {
        return candidateIds;
    }
}
