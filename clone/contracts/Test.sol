// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Test {
    function initialize(address _owner, string memory _name) external {
        require(!isBase, "ERROR: Cannot initialize");
        require(owner == address(0), "ERROR: Contract already initialized");
        owner = _owner;
        name = _name;
    }

    address public owner;
    bool public isBase;
    string public name;
    uint256 public num;

    modifier onlyOwner() {
        require(owner == msg.sender, "ERROR: Only Owner");
        _;
    }

    constructor() {
        isBase = true;
        owner = msg.sender;
    }

    function setNum(uint256 _num) external onlyOwner {
        num = _num + 2;
    }
}
