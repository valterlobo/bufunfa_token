// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script, console} from "forge-std/Script.sol";
import "../src/IERC20.sol";
import "../src/BufunfaToken.sol";

contract DeployToken is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory name = "Bufunfa";
        string memory symbol = "BFN";
        uint8 decimals = 18;

        IERC20 token = new BufunfaToken(1000000, name, symbol, decimals);
        console.log(address(token));

        vm.stopBroadcast();
    }
}
