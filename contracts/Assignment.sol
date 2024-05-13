// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

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
