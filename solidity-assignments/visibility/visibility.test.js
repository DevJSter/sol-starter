const VisibilityExample = artifacts.require("VisibilityExample");

contract("VisibilityExample", (accounts) => {
  let visibility;

  before(async () => {
    visibility = await VisibilityExample.deployed();
  });

  it("should call external function that calls internal function", async () => {
    const result = await visibility.externalFunction();
    assert.equal(result, "Internal Function Called", "Function call mismatch");
  });
});
