// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Test4 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    function initialize(string memory _name) public initializer {
        name = _name;
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    // event SetNum(uint256 _num);
    // event SetNumber(uint256 _number);

    // function setNumber(uint256 _number) public {
    //     number = _number + 2;
    //     emit SetNumber(number);
    // }

    // function hundredNum() public onlyOwner {
    //     num = 100;
    //     emit SetNum(num);
    // }

    // function tenNum() public onlyOwner {
    //     num = 10;
    //     emit SetNum(num);
    // }

    // function zeroNum() public onlyOwner {
    //     num = 0;
    //     emit SetNum(num);
    // }

    // function setNum(uint256 _num) public {
    //     num = _num + 2;
    //     emit SetNum(num);
    // }

    // uint256 public num;
    // string public name;
    // uint256 public number;

    string public name;
    uint256 public num;
    uint256 public number;

    event SetNum(uint256 _num);
    event SetNumber(uint256 _number);

    function setNum(uint256 _num) public {
        num = _num + 2;
        emit SetNum(num);
    }

    function tenNum() public onlyOwner {
        num = 10;
        emit SetNum(num);
    }

    function hundredNum() public onlyOwner {
        num = 100;
        emit SetNum(num);
    }

    function zeroNum() public onlyOwner {
        num = 0;
        emit SetNum(num);
    }

    function setNumber(uint256 _number) public {
        number = _number + 2;
        emit SetNumber(number);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        virtual
        override
        onlyOwner
    {}
}
