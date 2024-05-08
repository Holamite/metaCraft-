# SimpleContract

This Solidity smart contract demonstrates the use of require, revert, and assert statements.

## Overview

The SimpleContract allows an owner to set a value for transactions and enables others to buy using the buy function.

## Requirements

- Solidity compiler version ^0.8.19

## Contract Functions

### setValue(uint256 \_newValue)

- Allows the contract owner to set the value required for transactions.
- Only the contract owner can call this function.

### buy() payable

- Allows users to buy by sending ether to the contract.
- Requires that the sent value is equal to or greater than the value set.
- Reverts the transaction if the sent value exceeds a maximum amount.
- Transfers the sent ether to the contract owner.

## Example

```solidity
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    uint256 public Value = 10 ether;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _newValue) external {
        require(msg.sender == owner, "Only the owner can set the value");
        Value = _newValue;
    }

    function buy() external payable {


        // Revert if sent value exceeds maximum
        if (msg.value > 100 ether) {
            revert("Maximum amount exceeded");
        }

        // Ensure contract balance is positive
        assert(address(this).balance > 0);

        // Transfer funds to owner
        payable(owner).transfer(msg.value);
    }
}
```
