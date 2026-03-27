// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract userregistry{
    struct user {
        string name; 
        uint age;
    }

    mapping(address => user) users;

    function register (string memory name , uint age)public{
        require(users[msg.sender].age==0, "Already registered");
        users[msg.sender] = user(name,age);
    }

    function getMyData() public view returns(string memory,uint){
        user memory u = users[msg.sender];
        return(u.name , u.age);
    }
    function updateData(string memory name , uint age) public{
        require(users[msg.sender].age != 0 , "Not registered");
        users[msg.sender] = user(name,age);
    }

}