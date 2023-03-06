// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./Itest.sol";

contract Test is ITest, Initializable {
    function initialize(address _owner, string memory _name)
        public
        override
        initializer
    {
        owner = _owner;
        name = _name;
    }

    function clone(address _owner, string memory _name)
        public
        override
        notClone
    {
        owner = _owner;
        name = _name;
        isClone = true;
    }

    address public owner;
    bool public isClone;
    string public name;
    uint256 public num;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    modifier notClone() {
        require(!isClone && owner == address(0), "Can not clone");
        _;
    }

    event SetNum(uint256 _num);

    function setNum(uint256 _num) public override {
        num = _num + 2;
    }

    function setZero() public onlyOwner {
        num = 0;
    }
}
