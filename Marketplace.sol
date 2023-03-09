// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Marketplace {
    
    enum ShippingStatus { Pending, Shipped, Delivered }
    
    ShippingStatus public status;
    
    event MissionComplete(address indexed buyer, uint indexed orderId);
    
    constructor() {
        status = ShippingStatus.Pending;
    }
    
    function Shipped() public onlyOwner {
        status = ShippingStatus.Shipped;
    }
    
    function Delivered() public onlyOwner {
        status = ShippingStatus.Delivered;
        emit MissionComplete(msg.sender, block.number);
    }
    
    function getStatus() public view onlyOwner returns (ShippingStatus) {
        return status;
    }
    
    function Status() public payable returns (ShippingStatus) {
        require(msg.value > 0, "You need to pay to get the status.");
        return status;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
    
    address public owner = msg.sender;
}
