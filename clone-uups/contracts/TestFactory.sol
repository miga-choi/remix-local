// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./ITest.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract TestFactory {
    using Clones for address;

    address public owner;
    address public origin;

    event NewClone(address _newClone, address _owner);

    modifier onlyOwner() {
        require(owner == msg.sender, "ERROR: Only Owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setOrigin(address _origin) public onlyOwner {
        origin = _origin;
    }

    function clone(string memory _name, string memory _symbol)
        external
        returns (address newAddress)
    {
        newAddress = origin.cloneDeterministic(
            _getSalt(msg.sender, keccak256(abi.encode(_name, _symbol)))
        );
        ITest(newAddress).initialize(_name, _symbol);
        emit NewClone(newAddress, msg.sender);
    }

    function _getSalt(address _owner, bytes32 _nonce)
        private
        pure
        returns (bytes32)
    {
        return ((bytes32(uint256(uint160(_owner))) << 128) | (_nonce >> 128));
    }
}
