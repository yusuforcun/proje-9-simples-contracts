// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract ToDoList{

    struct Task{
        string content ;
        bool completed ;
    }

    mapping(address => Task[]) tasks ;

    function addTask(string memory _content)public{
        tasks[msg.sender].push(Task(_content , false)) ;
    }

  
    
    function toggleComplete(uint index) public {
        require(index < tasks[msg.sender].length,"Invalid index");
        Task storage task = tasks[msg.sender][index];
        task.completed = !task.completed;
    }

    function swappopTask(uint index) public{
        Task[] storage userTasks = tasks[msg.sender];
        require(index < userTasks.length,"Invalid index");
        userTasks[index] = userTasks[userTasks.length - 1];
        userTasks.pop();
    }

    function deleteTask (uint index) public{
        Task[] storage userTasks = tasks[msg.sender];
        require(index < userTasks.length,"Invalid index");
        delete userTasks[index];
    }

}