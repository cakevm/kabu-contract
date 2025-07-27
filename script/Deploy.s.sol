// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import "foundry-huff-neo/HuffNeoDeployer.sol";
import "forge-std/Script.sol";

contract Deploy is Script {
    function run() external returns (address deployedAddress) {
        deployedAddress = HuffNeoDeployer.config().set_broadcast(true).deploy("src/Multicaller.huff");
    }
}
