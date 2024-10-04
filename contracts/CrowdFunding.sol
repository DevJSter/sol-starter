pragma solidity ^0.8.0;

contract CrowdFunding {
    struct Campaign {
        address payable beneficiary;
        uint fundingGoal;
        uint amountRaised;
        uint deadline;
        bool fundingGoalReached;
        bool campaignClosed;
        mapping (address => uint) contributions;
    }

    uint public numCampaigns;
    mapping (uint => Campaign) public campaigns;

    function newCampaign(address payable beneficiary, uint goal, uint deadline) public returns (uint campaignID) {
        campaignID = numCampaigns++;
        Campaign storage c = campaigns[campaignID];
        c.beneficiary = beneficiary;
        c.fundingGoal = goal;
        c.deadline = deadline;
        c.fundingGoalReached = false;
        c.campaignClosed = false;
    }

    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        require(block.timestamp < c.deadline, "Campaign is closed");
        c.contributions[msg.sender] += msg.value;
        c.amountRaised += msg.value;
        if (c.amountRaised >= c.fundingGoal) {
            c.fundingGoalReached = true;
        }
    }

    function checkGoalReached(uint campaignID) public returns (bool reached) {
        Campaign storage c = campaigns[campaignID];
        if (block.timestamp < c.deadline) return false;
        if (c.fundingGoalReached) {
            c.beneficiary.transfer(c.amountRaised);
        } else {
            uint amount = c.contributions[msg.sender];
            c.contributions[msg.sender] = 0;
            payable(msg.sender).transfer(amount);
        }
        c.campaignClosed = true;
        return c.fundingGoalReached;
    }
}