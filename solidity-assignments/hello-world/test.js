const Contract = artifacts.require("Contract");

contract("Contract", (accounts) => {
  let instance;

  before(async () => {
    instance = await Contract.new();
    console.log('Contract deployed successfully.');
  });

  it("should deploy the contract and execute a function", async () => {
    console.log("Starting someFunction test...");
    const result = await instance.someFunction();
    console.log("Function executed. Result:", result);
    assert.equal(result, "expected result", "The function did not return the expected result");
  });
});