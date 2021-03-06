pragma solidity  ^0.8.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;
  
  constructor() public {
    owner = msg.sender;
  }

  modifier restricter(){
    if(msg.sender == owner) _;
  }

  function setCompleted(uint completed) {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) private{

  Migrations upgraded = Migrations(new_address);
  upgraded.setCompleted(last_completed_migration);
  
  }
}