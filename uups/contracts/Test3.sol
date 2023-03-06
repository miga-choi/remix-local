// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "./ITest.sol";

contract Test3 is ITest, Initializable, OwnableUpgradeable, UUPSUpgradeable {
    function initialize(string memory _name) public override initializer {
        name = _name;
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    string public name;
    uint256 public num;

    event SetNum(uint256 _num);

    function setNum(uint256 _num) public virtual override {
        num = _num * 1;
        emit SetNum(num);
    }

    function tenNum() public virtual override onlyOwner {
        num = 10;
        emit SetNum(num);
    }

    function hundredNum() public virtual override onlyOwner {
        num = 100;
        emit SetNum(num);
    }

    function zeroNum() public virtual override onlyOwner {
        num = 0;
        emit SetNum(num);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        virtual
        override
        onlyOwner
    {}
}
