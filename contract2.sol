// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract userregistry{
    struct user {
        string name ;
        uint age ;
    }
    mapping(address => user) users ;
}