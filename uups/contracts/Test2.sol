// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Test.sol";

contract Test2 is Test {
    function setNum(uint256 _num) public virtual override {
        num = _num - 1;
        emit SetNum(num);
    }

    function tenNum() public virtual onlyOwner {
        num = 10;
        emit SetNum(num);
    }
}
