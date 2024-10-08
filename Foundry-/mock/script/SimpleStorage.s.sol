// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageScript is Script {
        function run() external returns(SimpleStorage) {
                vm.startBroadcast();
                SimpleStorage simpleS+torage = new SimpleStorage();

                vm.stopBroadcast();
                return simpleStorage;
        }
}