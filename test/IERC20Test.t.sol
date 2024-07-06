// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {BufunfaToken} from "../src/BufunfaToken.sol";
import {IERC20} from "../src/IERC20.sol";

contract IERC20Test is Test {
    string public constant name = "Bufunfa";
    string public constant symbol = "BFN";
    uint8 public constant decimals = 18;

    IERC20 public token;
    address owner = address(0x1);
    address recipient = address(0x2);

    function setUp() public {
        vm.startPrank(owner);
        token = new BufunfaToken(1000000, name, symbol, decimals);
        vm.stopPrank();
        vm.deal(owner, 1 ether);
    }

    function testTotalSupply() public view {
        uint256 totalSupply = token.totalSupply();
        assertEq(totalSupply, 1000000 * 10 ** decimals);
    }

    function testBalanceOfOwner() public view {
        uint256 balance = token.balanceOf(owner);
        console.log(balance);
        assertEq(balance, 1000000 * 10 ** decimals);
    }

    function testTransfer() public {
        uint256 amount = 100 * 10 ** decimals;
        vm.startPrank(owner);
        token.transfer(recipient, amount);
        vm.stopPrank();

        uint256 balanceOwner = token.balanceOf(owner);
        uint256 balanceRecipient = token.balanceOf(recipient);

        assertEq(balanceOwner, (1000000 - 100) * 10 ** decimals);
        assertEq(balanceRecipient, amount);
    }

    function testTransfer_exceeds_balance() public {
        uint256 amount = 100 * 10 ** decimals;
        vm.expectRevert("ERC20: transfer amount exceeds balance");
        vm.startPrank(recipient);
        token.transfer(owner, amount);
        vm.stopPrank();
    }

    function testApproveAndTransferFrom() public {
        uint256 amount = 100 * 10 ** decimals;
        vm.startPrank(owner);
        token.approve(recipient, amount);
        vm.stopPrank();

        vm.startPrank(recipient);
        token.transferFrom(owner, recipient, amount);
        vm.stopPrank();

        uint256 balanceOwner = token.balanceOf(owner);
        uint256 balanceRecipient = token.balanceOf(recipient);

        assertEq(balanceOwner, (1000000 - 100) * 10 ** decimals);
        assertEq(balanceRecipient, amount);
    }

    function testTransferFrom_exceeds_allowance() public {
        uint256 amount = 100 * 10 ** decimals;
        vm.startPrank(owner);
        token.approve(recipient, amount);
        vm.stopPrank();

        vm.expectRevert("ERC20: transfer amount exceeds allowance");
        vm.startPrank(recipient);
        token.transferFrom(owner, recipient, amount * 10);
        vm.stopPrank();
    }
}
