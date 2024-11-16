const OwnerOnly = artifacts.require("OwnerOnly");

contract("OwnerOnly", (accounts) => {
  let ownerOnly;
  const [owner, other] = accounts;

  before(async () => {
    ownerOnly = await OwnerOnly.deployed();
  });

  it("should allow only the owner to call protected function", async () => {
    const result = await ownerOnly.protectedFunction({ from: owner });
    assert.equal(result, "Protected function called", "Owner should be able to call");

    try {
      await ownerOnly.protectedFunction({ from: other });
      assert.fail("Non-owner was able to call protected function");
    } catch (error) {
      assert(error.message.includes("Not the owner"), "Incorrect error message");
    }
  });
});
