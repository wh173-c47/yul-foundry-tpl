// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import {Test, console} from "forge-std/Test.sol";
import {Contract} from "./mocks/Contract.sol";
import {YulDeployer} from "./lib/YulDeployer.sol";

contract ContractTest is Test {
    YulDeployer yulDeployer = new YulDeployer();
    Contract ctr;

    function setUp() public {
        ctr = Contract(yulDeployer.deployContract("Contract"));
    }

    // Your tests here
}
