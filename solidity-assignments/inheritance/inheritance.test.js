const Child = artifacts.require("Child");

contract("Inheritance", (accounts) => {
  let child;

  before(async () => {
    child = await Child.deployed();
  });

  it("should return greeting from child", async () => {
    const greeting = await child.greet();
    assert.equal(greeting, "Hello from Child", "Greeting mismatch");
  });
});
