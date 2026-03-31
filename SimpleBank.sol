// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract MiniBank{
    event Deposit(address indexed user , uint amount);
    event Withdraw(address indexed user , uint amount);
    event CheckBalances(address indexed user , uint amount);

    struct User{
        address userAddress;
        uint amount;
    }

    mapping(address => uint) public balances ;

    function deposit () public payable {
        require(msg.value > 0 , "Minimum 1 wei");

        balances[msg.sender]+= msg.value ;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount , "insufficient");

        balances[msg.sender] -= amount ;

        (bool success , ) = payable(msg.sender).call{value:amount}("");

        require(success,"Unsuccesful");

        emit Withdraw(msg.sender, amount); 
    }

    function checkBalance() public view returns(uint){
        return  balances[msg.sender];
    }
}