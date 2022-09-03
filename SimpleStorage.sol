// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    struct ClassRoom {
        uint maxCapacity;
        string name;
        uint currentStrenth;
    }
    mapping(string => uint) studentsMap;

    ClassRoom[] public classRoomArray;

    function addToarray(string memory _name, uint _maxCapacity,  uint _currentStrenth ) public {
        ClassRoom memory _classRoom   = ClassRoom({maxCapacity: _maxCapacity, name: _name, currentStrenth : _currentStrenth});
        classRoomArray.push(_classRoom);
        studentsMap[_name] = _currentStrenth;
    }

    function getMapValue(string memory name) public view returns(uint) {
        return studentsMap[name];
    }




}
