// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Todo hash the text
contract TodoList {
    struct Todo {
        uint256 id;
        bytes32 hashedText; // Store the hashed text       
        uint256 timeCreated;
        bool completed;
    }

    Todo[] private s_todos;
    mapping(uint256 id => Todo s_todos) todoById;

     function hashText(string calldata _text) internal pure returns (bytes32) {
        return keccak256(bytes(_text));
    }

    function createTodo(string calldata _text) external {
        // add todo to the array of todos
        uint256 id = s_todos.length + 1;

        // hash text to get fixed output lenght
         bytes32 _hashedText = hashText(_text);

        Todo memory newTodo =
            Todo({id: id, hashedText: _hashedText, timeCreated: block.timestamp, completed: false});
        s_todos.push(newTodo);

        // add new todo the mapping
        todoById[id] = newTodo;
    }

    function updateTodo(uint256 _id, string calldata _text) external {
        Todo storage todo = todoById[_id];

          // hash text to get fixed output lenght
         bytes32 _hashedText = hashText(_text);

        todo.hashedText = _hashedText;
        Todo storage arrTodo = s_todos[_id -1];
        arrTodo.hashedText = _hashedText;
    }

    function getTodos() external view returns (Todo[] memory) {
        return s_todos;
    }

    function getTodoById (uint256 _id) external view returns (Todo memory){
        return todoById[_id];
    }

    function toggleCompleted(uint256 _id) external {
        todoById[_id].completed = !todoById[_id].completed;
        s_todos[_id - 1].completed = !s_todos[_id - 1].completed;
    }
}
