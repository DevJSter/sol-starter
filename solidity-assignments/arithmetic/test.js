const Arithmetic = artifacts.require("Arithmetic");

contract("Arithmetic", (accounts) => {
  let instance;

  before(async () => {
    instance = await Arithmetic.new();
  });

  describe("Addition", () => {
    it("should return the sum of two numbers", async () => {
      const result = await instance.add(5, 3);
      assert.equal(result.toNumber(), 8, "Addition of 5 and 3 should be 8");
    });
  });

  describe("Subtraction", () => {
    it("should return the difference of two numbers", async () => {
      const result = await instance.subtract(10, 3);
      assert.equal(result.toNumber(), 7, "Subtraction of 10 and 3 should be 7");
    });

    it("should revert if the result would be negative", async () => {
      try {
        await instance.subtract(3, 10);
        assert.fail("Expected revert not received");
      } catch (error) {
        assert(error.message.includes("revert"), "Expected revert error, got: " + error.message);
      }
    });
  });

  describe("Multiplication", () => {
    it("should return the product of two numbers", async () => {
      const result = await instance.multiply(4, 3);
      assert.equal(result.toNumber(), 12, "Multiplication of 4 and 3 should be 12");
    });
  });

  describe("Division", () => {
    it("should return the quotient of two numbers", async () => {
      const result = await instance.divide(10, 2);
      assert.equal(result.toNumber(), 5, "Division of 10 by 2 should be 5");
    });

    it("should revert if division by zero is attempted", async () => {
      try {
        await instance.divide(10, 0);
        assert.fail("Expected revert not received");
      } catch (error) {
        assert(error.message.includes("revert"), "Expected revert error, got: " + error.message);
      }
    });
  });
});
