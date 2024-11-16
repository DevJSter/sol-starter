// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    event MessageLogged(string message);

    function logMessage(string calldata message) public {
        emit MessageLogged(message);
    }
}
