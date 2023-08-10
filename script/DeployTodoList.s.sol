// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TodoList} from "../src/TodoList.sol";

contract DeployTodoList is Script {
TodoList todoList;
    function run() public returns(TodoList){
        todoList = new TodoList();
        return todoList;
    }
}
