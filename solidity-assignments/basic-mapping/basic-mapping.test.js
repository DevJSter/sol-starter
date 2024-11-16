const UserBalance = artifacts.require("UserBalance");

contract("UserBalance", (accounts) => {
  let userBalance;

  before(async () => {
    userBalance = await UserBalance.deployed();
  });

  it("should start with zero balance", async () => {
    const balance = await userBalance.getBalance({ from: accounts[0] });
    assert.equal(balance.toNumber(), 0, "Initial balance is not zero");
  });

  it("should add balance on deposit", async () => {
    await userBalance.deposit(50, { from: accounts[0] });
    const balance = await userBalance.getBalance({ from: accounts[0] });
    assert.equal(balance.toNumber(), 50, "Balance after deposit is incorrect");

    await userBalance.deposit(30, { from: accounts[0] });
    const newBalance = await userBalance.getBalance({ from: accounts[0] });
    assert.equal(newBalance.toNumber(), 80, "Balance after second deposit is incorrect");
  });
});
