// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "./ITest.sol";

contract Test is ITest, Initializable {
    function initialize(address _owner, string memory _name)
        public
        override
        initializer
    {
        owner = _owner;
        name = _name;
    }

    address public owner;
    string public name;
    uint256 public num;

    event SetNum(uint256 _num);

    modifier onlyOnwer() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    function setNum(uint256 _num) public {
        num = _num + 1;
    }

    function zeroNum() public onlyOnwer {
        num = 0;
    }
}
