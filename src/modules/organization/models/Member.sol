// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

struct Member {
    address account;
    uint256 balance;
    bool exists;
    bool active; // This could be useful to check if a member is active or not to determine if should be paid.
}