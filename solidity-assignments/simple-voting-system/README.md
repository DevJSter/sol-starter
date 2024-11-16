**Title:** Simple Voting System
**Concepts:** Arrays, loops, mappings, managing ownership.

**Problem Statement:**
Create a Voting contract where a list of candidates can be voted for by users. The contract should:

- Allow only the contract owner to initialize candidates using the addCandidates() function.
- Provide a vote() function to cast a vote for a candidate by ID.
- Provide a getVotes(uint256 candidateId) function to view the vote count for a specific candidate.