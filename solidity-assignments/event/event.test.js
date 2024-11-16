const EventLogger = artifacts.require("EventLogger");

contract("EventLogger", (accounts) => {
  let logger;

  before(async () => {
    logger = await EventLogger.deployed();
  });

  it("should log message correctly", async () => {
    const tx = await logger.logMessage("Hello, world!");
    const log = tx.logs[0];
    assert.equal(log.event, "MessageLogged", "Event name mismatch");
    assert.equal(log.args.message, "Hello, world!", "Message not logged correctly");
  });
});
