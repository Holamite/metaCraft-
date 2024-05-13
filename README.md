# SimpleContract

This Solidity smart contract demonstrates the use of require, revert, and assert statements.
The Assignment contract includes functionality for user authentication and subscription. It stores user information, including their role and registration status, and allows them to subscribe by paying a fee.

## Overview

This Solidity smart contract allows users to authenticate themselves and subscribe by paying a fee.

## Requirements

- Solidity compiler version ^0.8.19

## Contract Functions

### authenticateUser(string \_role) external

Registers a user with the provided role.
Requires that the user is not already registered.
Emits an event upon successful registration.

### subscription(uint \_age, Sex \_sex) external payable

Allows users to subscribe by paying a fee.
Requires that the user is above 18 years old.
Requires that the user's gender is male (0).
Transfers the sent ether to the contract.

## Example

```solidity
pragma solidity ^0.8.0;

contract Assignment {
    address owner;
    uint age = 18;

    enum Sex {
        male,
        female
    }

    struct User {
        bool isRegistered;
        string role;
    }

    mapping(address => User) users;

    constructor() {
        owner = msg.sender;
    }

    function authenticateUser(string memory _role) external {
        require(!users[msg.sender].isRegistered, "User already exist");

        users[msg.sender] = User(true, _role);
    }

    function subscription(uint _age, Sex _sex) external payable {
        if (_age < age) {
            revert("You must be above 18Years");
        }

        assert(_sex == Sex(0));

        payable(msg.sender).transfer(msg.value);
    }
}
```
