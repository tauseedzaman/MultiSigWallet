// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSigWallet {
    address[] public owners;

    struct transaction {
        address distination;
        uint256 amount;
        uint256 approvals;
        bool executed;
        mapping(address => bool) approvalsReceived;
    }

    constructor(address[] memory _owners) {
        for (uint256 i = 0; i < _owners.length; i++) {
            owners.push(_owners[i]);
        }
    }

    modifier onlyOwner() {
        bool _owner = false;
        for (uint256 i = 0; i < owners.length; i++) {
            if (msg.sender == owners[i]) {
                _owner = true;
                break;
            }
        }
        require(!_owner, "Sorry, Only Owners are allowed..");
        _;
    }

    // wallet has more then one owners

    // any owner can initate transaction

    // user can sign a transaction once

    // once more then 50% of the owner aggree on action. it will be performed
}
