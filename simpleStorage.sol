// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract userregistry{
    struct user {
        string name; 
        uint age;
    }

    address public owner ;

    event update(address user , string name ,uint age);

    mapping(address => user) users;

    mapping(address => user[]) public history ;

    modifier onlyOwner(){
        require(msg.sender == owner,"Only owner");
        _;
    }

    function register (string memory name , uint age)public{
        require(users[msg.sender].age==0, "Already registered");
        users[msg.sender] = user(name,age);
    }

    function getMyData() public view returns(string memory,uint){
        user memory u = users[msg.sender];
        return(u.name , u.age);
    }

    function getMyData2() public view returns(string memory,uint){
        return(users[msg.sender].name,users[msg.sender].age);
    }

    function updateData(string memory name , uint age) public {
        require(users[msg.sender].age != 0 , "Not registered");
        history[msg.sender].push(users[msg.sender]);
        users[msg.sender] = user(name,age);
        emit update(msg.sender , name , age);
    }

    function updateName(string memory name)public {
        require(users[msg.sender].age != 0,"Not registered");
        history[msg.sender].push(users[msg.sender]);
        users[msg.sender].name = name;
        emit update(msg.sender,name,users[msg.sender].age);
    }

    function updateAge(uint age)  public {
        require(users[msg.sender].age != 0,"Not registered");
        history[msg.sender].push(users[msg.sender]);
        users[msg.sender].age = age;
        emit update(msg.sender,users[msg.sender].name,age);
    }


}