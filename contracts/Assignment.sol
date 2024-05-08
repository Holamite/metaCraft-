// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Assignment {
    address public owner;
    uint256 public value = 10 ether;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _newValue) external {
        require(msg.sender == owner, "Only the owner can set the value");
        value = _newValue;
    }

    function buy() external payable {
        require(msg.value >= value, "Insufficient value sent");

        // If some condition is not met, revert and return funds
        if (msg.value > 100 ether) {
            revert("Amount sent exceeds maximum allowed");
        }

        // If the condition is met, continue with the transaction

        // Assertion: Check if the contract balance is greater than zero
        assert(address(this).balance > 0);

        // Transfer funds to the owner
        payable(owner).transfer(msg.value);
    }
}
