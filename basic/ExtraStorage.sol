// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
 function store(uint _num) public override {
        number = _num + 5;
    }
}
