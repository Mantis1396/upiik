// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract upiik {

    mapping(address => uint) public balances;

    uint public totalSupply;

    uint public totalClaimed;
    
    mapping(address => bool) public claimed;

    constructor() {
        totalSupply = 5000000000;
    }

    function claim() public {

        require(totalClaimed < totalSupply, "All Claimed");

        require(!claimed[msg.sender], "Tokens Claimed");

        claimed[msg.sender] = true;
        balances[msg.sender] += 1000;
        totalClaimed += 1000;
    }

    function safeTransfer(address _to, uint _amount) public {

        require(_to != address(0), "UnsafeTransfer: zero address");

        require(balances[_to] > 0, "UnsafeTransfer: zero balance");

        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
    error UnsafeTransfer(address _address);
}
