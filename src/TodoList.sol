// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TodoList {
    struct Todo {
        uint256 id;
        string text;
        uint256 timeCreated;
        bool completed;
    }

    Todo[] private s_todos;
    mapping(uint256 id => Todo s_todos) todoById;

    function createTodo(string calldata _text) external {
        // add todo to the array of todos
        uint256 id = s_todos.length + 1;
        Todo memory newTodo = Todo({id: id, text: _text, timeCreated: block.timestamp, completed: false});
        s_todos.push(newTodo);

        // add new todo the mapping
        todoById[id] = newTodo;
    }

    function updateTodo(uint256 _id, string calldata _text) external {
        // Update the todo mapping
        Todo storage todo = todoById[_id];
        todo.text = _text;

        // update the todo array
        Todo storage arrTodo = s_todos[_id - 1];
        arrTodo.text = _text;
    }

    function getTodos() external view returns (Todo[] memory) {
        return s_todos;
    }

    function getTodoById(uint256 _id) external view returns (Todo memory) {
        return todoById[_id];
    }

    function toggleCompleted(uint256 _id) external {
        // Update the todo mapping
        todoById[_id].completed = !todoById[_id].completed;

        // update the todo array
        s_todos[_id - 1].completed = !s_todos[_id - 1].completed;
    }
}
