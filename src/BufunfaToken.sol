// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./IERC20.sol";

/// @title BufunfaToken - Implementation of the ERC20 token standard
contract BufunfaToken is IERC20 {
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Token decimals
    uint8 private immutable _decimals;

    // Total supply of the token
    uint256 private immutable _totalSupply;

    // Mapping from account addresses to their balances
    mapping(address => uint256) private _balances;

    // Mapping from owner addresses to their allowances for spender addresses
    mapping(address => mapping(address => uint256)) private _allowances;

    /// @notice Constructor to initialize the token with initial supply, name, symbol, and decimals
    /// @param initialSupply Initial supply of the tokens
    /// @param nm Name of the token
    /// @param sb Symbol of the token
    /// @param d Number of decimals for the token
    constructor(uint256 initialSupply, string memory nm, string memory sb, uint8 d) {
        _totalSupply = initialSupply * 10 ** uint256(d);
        _balances[msg.sender] = _totalSupply;
        _name = nm;
        _symbol = sb;
        _decimals = d;

        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /// @notice Returns the name of the token
    /// @return The name of the token
    function name() public view virtual returns (string memory) {
        return _name;
    }

    /// @notice Returns the symbol of the token
    /// @return The symbol of the token
    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    /// @notice Returns the number of decimals the token uses
    /// @return The number of decimals the token uses
    function decimals() public view virtual returns (uint8) {
        return _decimals;
    }

    /// @notice Returns the total supply of the token
    /// @return The total supply of the token
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /// @notice Returns the balance of a specific account
    /// @param account The address of the account to query
    /// @return The balance of the specified account
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /// @notice Transfers tokens from the caller's account to a recipient account
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @return A boolean indicating whether the operation succeeded
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(_balances[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    /// @notice Returns the remaining number of tokens that spender is allowed to spend on behalf of owner
    /// @param owner The address of the token owner
    /// @param spender The address of the spender
    /// @return The number of tokens still available for the spender
    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    /// @notice Approves the spender to spend a specified amount of tokens on behalf of the caller
    /// @param spender The address of the spender
    /// @param amount The amount of tokens to approve
    /// @return A boolean indicating whether the operation succeeded
    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    /// @notice Transfers tokens from a sender account to a recipient account using an allowance
    /// @param sender The address of the sender
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to transfer
    /// @return A boolean indicating whether the operation succeeded
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(_balances[sender] >= amount, "ERC20: transfer amount exceeds balance");
        require(_allowances[sender][msg.sender] >= amount, "ERC20: transfer amount exceeds allowance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }
}
