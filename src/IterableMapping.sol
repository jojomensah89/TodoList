// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract IterableMapping {
    //  create the mapping
    mapping(address user => uint256 amount) public balances;

    // create a mapping for users being inserted
    mapping(address user => bool added) public inserted;

    // create an array to store the addresses
    address[] public users;

    function addUser(address _user, uint256 _amount) external {
        balances[_user] = _amount;

        if (!inserted[_user]) {
            inserted[_user] = true;
            users.push(_user);
        }
    }

    function getNumberOfUsers() external view returns (uint256) {
        return users.length;
    }

    function getBalanceOfFirstUser() external view returns (uint256) {
        uint256 userBalance = balances[users[0]];
        return userBalance;
    }

    function getBalanceOfLastUser() external view returns (uint256) {
        uint256 userBalance = balances[users[users.length - 1]];
        return userBalance;
    }

    function getBalanceOfAnyUser(uint256 _index) external view returns (uint256) {
        uint256 userBalance = balances[users[_index]];
        return userBalance;
    }
}
