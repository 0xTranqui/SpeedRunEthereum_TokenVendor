pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// learn more: https://docs.openzeppelin.com/contracts/3.x/erc20

contract YourToken is ERC20 {

    /// set initial supply to be minted by constructor
    uint256 initialSupply = 1000 * (10 ** 18);

    /// constructor deplies initial token contract and mints total supply
    constructor() ERC20("Gold", "GLD") {
        _mint(msg.sender, initialSupply);
    }

    
}
