const Wallet = artifacts.require("Wallet");

contract("Wallet", (accounts) => {
  let wallet;
  const [owner, user] = accounts;

  before(async () => {
    wallet = await Wallet.deployed();
  });

  it("should accept deposits", async () => {
    await wallet.deposit({ from: user, value: web3.utils.toWei("1", "ether") });
    const balance = await wallet.getBalance();
    assert.equal(balance.toString(), web3.utils.toWei("1", "ether"), "Balance mismatch after deposit");
  });

  it("should allow only owner to withdraw", async () => {
    try {
      await wallet.withdrawAll({ from: user });
      assert.fail("Non-owner was able to withdraw");
    } catch (error) {
      assert(error.message.includes("Only owner can withdraw"), "Incorrect error message");
    }
    await wallet.withdrawAll({ from: owner });
    const balance = await wallet.getBalance();
    assert.equal(balance.toString(), "0", "Balance should be zero after withdrawal");
  });
});
