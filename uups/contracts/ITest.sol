// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface ITest {
    function initialize(string memory _name) external;

    function setNum(uint256 _num) external;

    function zeroNum() external;

    function tenNum() external;

    function hundredNum() external;
}
