
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
 import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createContracts() public {
        SimpleStorage simpleStorage  = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint index, uint number) public {
      simpleStorageArray[index].store(number);
    }

    function sfGetStore(uint index) public view returns(uint) {
        return simpleStorageArray[index].getNum();
    }

}
