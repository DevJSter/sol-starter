const Voting = artifacts.require("Voting");

contract("Voting", (accounts) => {
  let voting;
  const owner = accounts[0];

  before(async () => {
    voting = await Voting.deployed();
  });

  it("should add candidates only by owner", async () => {
    await voting.addCandidates(["Pawan", "Siddhu"], { from: owner });
    const candidate1 = await voting.candidates(0);
    assert.equal(candidate1.name, "Pawan", "Candidate 1 name mismatch");
    const candidate2 = await voting.candidates(1);
    assert.equal(candidate2.name, "Siddhu", "Candidate 2 name mismatch");
  });

  it("should allow voting and track votes", async () => {
    await voting.vote(0, { from: accounts[1] });
    const voteCount = await voting.getVotes(0);
    assert.equal(voteCount.toNumber(), 1, "Vote count for candidate 0 should be 1");

    await voting.vote(1, { from: accounts[2] });
    const voteCount2 = await voting.getVotes(1);
    assert.equal(voteCount2.toNumber(), 1, "Vote count for candidate 1 should be 1");
  });

  it("should prevent double voting", async () => {
    try {
      await voting.vote(0, { from: accounts[1] });
      assert.fail("Expected error not received");
    } catch (error) {
      assert(error.message.includes("Already voted"), "Error message does not contain 'Already voted'");
    }
  });
});
