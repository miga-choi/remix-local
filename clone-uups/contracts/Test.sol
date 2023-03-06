// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

import "./ITest.sol";

contract Test is ITest, Initializable, OwnableUpgradeable, UUPSUpgradeable {
    function initialize(string memory _name, string memory _symbol) public initializer {
        name = _name;
        symbol = _symbol;
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    string public name;
    string public symbol;
    uint256 public num;

    event SetNum(uint256 _num);

    function setNum(uint256 _num) public virtual {
        num = _num + 2;
        emit SetNum(_num);
    }

    function _authorizeUpgrade(address newImplementation) internal virtual override onlyOwner {}
}
