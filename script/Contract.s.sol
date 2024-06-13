// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {Script, console} from "forge-std/Script.sol";

contract ContactScript is Script {
    // Does not work on zksync era due to their addr computation
    // Need to rather deploy a factory or find one
    address private constant _FACTORY =
        0x4e59b44847b379578588920cA78FbF26c0B4956C;
    uint256 private constant _NONCE = 0x0;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        string memory bashCommand = string.concat(
            'cast abi-encode "f(bytes)" $(solc --strict-assembly yul/',
            string.concat(
                "Contract.yul --bin | grep '^[0-9a-fA-Z]*$')"
            )
        );

        string[] memory inputs = new string[](3);
        inputs[0] = "bash";
        inputs[1] = "-c";
        inputs[2] = bashCommand;

        bytes memory bytecode = abi.decode(vm.ffi(inputs), (bytes));

        // quick dirty dirty trick
        assembly {
            let len := mload(bytecode)

            mstore(bytecode, _NONCE)

            pop(call(
                gas(),
                _FACTORY,
                0x0,
                bytecode,
                add(0x20, len),
                returndatasize(),
                returndatasize()
            ))
        }

        ///@notice return the address that the contract was deployed to
        vm.stopBroadcast();

        console.log("Contract deployed");
    }
}
