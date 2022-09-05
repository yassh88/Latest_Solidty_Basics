// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "./PriceConvert.sol";

contract FundMe {
    using PriceConvert for uint256;
    // AggregatorV3Interface internal priceFeed;
    uint public minmumUSD  = 50 * 1e18;

    address public owner;

   constructor() {
       owner = msg.sender;
   }

    address[] public funder;
    mapping(address => uint) funderMap;

    function fund() public payable {
        require(msg.value.getConversion() => 1e18, "Value should be more then 1 Ether");
        funder.push(msg.sender);
        funderMap[msg.sender] += msg.value ;
    }

    function withdraw() public onlyOwner {
        for(uint i = 0; i < funder.length; i++){
            funderMap[funder[i]] = 0;
        }
        funder = new address[](0);
        payable(msg.sender).transfer(address(this).balance);
        bool result = payable(msg.sender).send(address(this).balance);
        require(result, "send fail");
        (bool resultCal,) = payable(msg.sender).call{value: address(this).balance}("");
        require(resultCal, "send fail");
    }

    modifier onlyOwner {
        require(owner == msg.sender, "only owner can withdraw");
        _;
    }

}
