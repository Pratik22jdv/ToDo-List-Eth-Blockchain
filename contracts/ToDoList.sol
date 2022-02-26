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

    event TaskCreated (
        uint id, 
        string content, 
        bool completed
    ); //To listen to external event on client side

    event TaskCompleted(
        uint id,
        bool completed
    );

    //Add default task in to-do list when contract is deployed
    constructor () public {
        createTask("Finish To-Do-List Blockchain project");
    }

    function createTask (string memory _content) public
    {
        taskCount++;
        tasks[taskCount]=Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
    //tasks[] has an dynamic size and there is no way to know the size of this hashMap.
    //We can't iterate over tasks[] and all content in it. We need to have reference to fetch particular content.
    //That's why mapping is used and taskCount variable is maintained.

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
  }
}