// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./ITest.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestFactory is Ownable {
    using Clones for address;

    address public origin;

    event NewClone(address _newClone, address _owner);

    constructor() {}

    function setOrigin(address _origin) public onlyOwner {
        origin = _origin;
    }

    function _clone(string memory _name) external returns (address newAddress) {
        newAddress = origin.cloneDeterministic(
            _getSalt(msg.sender, keccak256(abi.encode(_name)))
        );
        ITest(newAddress).clone(msg.sender, _name);
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
