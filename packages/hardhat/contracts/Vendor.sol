pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  /// CONSTANTS
  YourToken public yourToken;
  uint256 public amountOfEth;
  uint256 public amountOfTokens;
  uint256 public constant tokensPerEth = 100;

  /// EVENTS
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  event SellTokens(address seller, uint256 amountOfETH, uint256 amountOfTokens);

  /// MODIFIERS

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:
  function buyTokens() public payable {
    amountOfEth = msg.value;
    amountOfTokens = amountOfEth * tokensPerEth;
    yourToken.transfer(msg.sender, amountOfTokens);
    emit BuyTokens(msg.sender, amountOfEth, amountOfTokens);
  }

  /// ToDo: create a withdraw() function that lets the owner withdraw ETH

  function withdraw() external onlyOwner {
    payable(msg.sender).transfer(address(this).balance);
  }

  // ToDo: create a sellTokens() function:
  function sellTokens(uint256 approvalAmount) public {
    yourToken.transferFrom(msg.sender, address(this), approvalAmount);
    payable(msg.sender).transfer(approvalAmount / tokensPerEth);
    emit SellTokens(msg.sender, approvalAmount / tokensPerEth, approvalAmount);
  }

}
