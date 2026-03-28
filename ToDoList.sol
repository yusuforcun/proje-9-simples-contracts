// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract ToDoList{

    event TaskAdded(address indexed user,string content );
    event TaskDeleted(address indexed user , uint index);
    event TaskToggled(address indexed user , uint index , bool completed);

    struct Task{
        string content ;
        bool completed ;
    }

    mapping(address => Task[]) tasks ;

    function addTask(string memory _content)public{
        tasks[msg.sender].push(Task(_content , false)) ;
        emit TaskAdded(msg.sender, _content);
    }

  
    
    function toggleComplete(uint index) public {
        require(index < tasks[msg.sender].length,"Invalid index");
        Task storage task = tasks[msg.sender][index];
        task.completed = !task.completed;
        emit TaskToggled(msg.sender, index, task.completed);
    }

    function swappopTask(uint index) public{
        Task[] storage userTasks = tasks[msg.sender];
        require(index < userTasks.length,"Invalid index");
        userTasks[index] = userTasks[userTasks.length - 1];
        userTasks.pop();
        emit TaskDeleted(msg.sender, index);
    }

    function deleteTask (uint index) public{
        Task[] storage userTasks = tasks[msg.sender];
        require(index < userTasks.length,"Invalid index");
        delete userTasks[index];
        emit TaskDeleted(msg.sender, index);
    }

}