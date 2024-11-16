const StatusContract = artifacts.require("StatusContract");

contract("StatusContract", (accounts) => {
  let statusContract;
  const [owner, user] = accounts;

  before(async () => {
    statusContract = await StatusContract.new({ from: owner, value: web3.utils.toWei("1", "ether") });
  });

  it("should initialize with Pending status", async () => {
    const status = await statusContract.currentStatus();
    assert.equal(status.toString(), "0", "Initial status should be Pending");
  });

  it("should only allow owner to activate the contract", async () => {
    try {
      await statusContract.activate({ from: user });
      assert.fail("Non-owner was able to activate");
    } catch (error) {
      assert(error.message.includes("Not the contract owner"), "Expected onlyOwner modifier restriction");
    }
    await statusContract.activate({ from: owner });
    const status = await statusContract.currentStatus();
    assert.equal(status.toString(), "1", "Status should be Active after activation");
  });

  it("should emit an event when status changes to Active", async () => {
    const receipt = await statusContract.activate({ from: owner });
    assert.equal(receipt.logs[0].event, "StatusChanged", "Event StatusChanged should be emitted");
    assert.equal(receipt.logs[0].args.newStatus.toString(), "1", "Event should emit new status as Active");
  });

  it("should only allow completion if status is Active", async () => {
    await statusContract.activate({ from: owner });
    await statusContract.complete({ from: owner });
    const status = await statusContract.currentStatus();
    assert.equal(status.toString(), "2", "Status should be Completed after complete");

    const isComplete = await statusContract.isComplete();
    assert.equal(isComplete, true, "Contract should be marked as complete");
  });

  it("should accept funds through fundContract function", async () => {
    const initialBalance = await statusContract.contractBalance();
    await statusContract.fundContract({ from: user, value: web3.utils.toWei("0.5", "ether") });
    const newBalance = await statusContract.contractBalance();
    assert.equal(
      newBalance.toString(),
      (parseInt(initialBalance) + parseInt(web3.utils.toWei("0.5", "ether"))).toString(),
      "Contract balance should increase after funding"
    );
  });
});
