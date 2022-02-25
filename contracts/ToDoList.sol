pragma solidity >=0.4.22 <0.9.0;

contract ToDoList
{
    uint public taskCount=0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint=>Task) public tasks; //Storing key value pair

    //Add default task in to-do list when contract is deployed
    constructor () public {
        createTask("Finish To-Do-List Blockchain project");
    }

    function createTask (string memory _content) public
    {
        taskCount++;
        tasks[taskCount]=Task(taskCount, _content, false);
    }
    //tasks[] has an dynamic size and there is no way to know the size of this hashMap.
    //We can't iterate over tasks[] and all content in it. We need to have reference to fetch particular content.
    //That's why mapping is used and taskCount variable is maintained.
}