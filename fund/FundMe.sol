// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    // AggregatorV3Interface internal priceFeed;
    uint public minmumUSD  = 50 * 1e18;

    address[] public funder;
    mapping(address => uint) funderMap;

    function fund() public payable {
         
        require(getConversion(msg.value) > 1e18, "Value should be more then 1 Ether");
        funderMap[msg.sender]= msg.value;
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,, ) = priceFeed.latestRoundData();
        return uint256(price* 1e10);
    }

    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversion(uint256 ethAmout) public view returns(uint256){
        return (ethAmout * getPrice())/1e18;
    }

    // function withdraw(){}

}
