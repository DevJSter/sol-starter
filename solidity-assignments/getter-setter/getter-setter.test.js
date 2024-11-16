const Person = artifacts.require("Person");

contract("Person", (accounts) => {
  let person;

  before(async () => {
    person = await Person.deployed();
  });

  it("should set and get name", async () => {
    await person.setName("Sidd");
    const name = await person.getName();
    assert.equal(name, "Sidd", "Name mismatch");
  });
});
