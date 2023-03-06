// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./ITest.sol";

contract Test3 is ITest, Initializable {
    function initialize(address _owner, string memory _name)
        public
        override
        initializer
    {
        owner = _owner;
        name = _name;
    }

    modifier onlyOnwer() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    uint256 public num;
    address public owner;
    string public name;

    event SetNum(uint256 _num);

    function tenNum() public onlyOnwer {
        num = 10;
    }

    function hundredNum() public onlyOnwer {
        num = 100;
    }

    function zeroNum() public onlyOnwer {
        num = 0;
    }

    function setNum(uint256 _num) public {
        num = _num * 1;
    }
}
