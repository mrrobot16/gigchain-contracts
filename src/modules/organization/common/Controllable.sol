// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

abstract contract Controllable {
    address private _owner;
    address private _controller;
    event ControllershipTransferred(address indexed previousController, address indexed newController);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function initializeControllable() internal {
        _controller = msg.sender;
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
        emit ControllershipTransferred(address(0), msg.sender);
    }

    function controller() public view returns (address) {
        return _controller;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    modifier onlyController(string memory functionName) {
        string memory message = string(abi.encodePacked("Only the controller can call: ", functionName));
        require(msg.sender == _controller, message);
        _;
    }

    modifier onlyOwner(string memory functionName) {
        string memory message = string(abi.encodePacked("Only the owner can call: ", functionName));
        require(msg.sender == _owner, message);
        _;
    }

    modifier cannotZeroAddress (address newRole) {
        require(newRole != address(0), "Address of new role cannot be zero address");
        _;
    }

    function renounceOwnership() public virtual onlyOwner("renounceOwnership") {
        _owner = address(0);
        emit OwnershipTransferred(_owner, address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner("transferOwnership") cannotZeroAddress(newOwner) {
        _owner = newOwner;
        emit OwnershipTransferred(_owner, newOwner);
    }

    function transferControllership(address newController) public virtual onlyOwner("transferOwnership") cannotZeroAddress(newController) {
        _controller = newController;
        emit ControllershipTransferred(_controller, newController);
    }
}


// modifier onlyOwner(string memory functionName) {
//         string memory message = string(abi.encodePacked("Only the owner can call: ", functionName));
//         require(msg.sender == owner, message);
//         _;
//     }

//     modifier mustSendEther(uint _amount) {
//         require(_amount > 0, "You must send some Ether");
//         _;
//     }

//     modifier correctAmount(uint _amount) {
//         uint256 balance = address(this).balance;
//         require(_amount <= balance, "You must send the correct amount of Ether");
//         _;
//     }

//     modifier correctAmounts(uint256[] memory _amounts) {
//         uint256 total = 0;
//         for (uint i = 0; i < _amounts.length; i++) {
//             total += _amounts[i];
//         }
//         require(total <= address(this).balance, "You must send the correct amount of Ether");
//         _;
//     }

//     modifier onlyController(string memory functionName) {
//         string memory message = string(abi.encodePacked("Only the controller can call: ", functionName));
//         require(msg.sender == controller, message);
//         _;
//     }