// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

// Keep track of migration process by providing a l_c_m
contract Migrations {
  address public owner;
  uint public last_completed_migration;

  // if sender is owner, continue, else dont
  modifier restricted() {
    if (msg.sender == owner) _;
  }

  // Mark owner as the address that deployed this contract
  constructor() {
    owner = msg.sender;
  }

  // Update l_c_m, using restricted modifier
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
