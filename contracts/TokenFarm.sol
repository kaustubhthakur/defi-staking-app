//SPDX-License-Identifier :MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract TokenFarm is Ownable
{
    address[] public s_allowedTokens;
    mapping(address => mapping(address => uint256)) public s_stakingBalance ;

function stakeTokens(uint256 amount,address token) public 
{
    require(amount>0 ,"amount cannot be zero");
    require(tokenIsAllowed(token),"Token Isnt allowed");
IERC20(token).transferFrom(msg.sender,address(this),amount);
s_stakingBalance[token][msg.sender] = s_stakingBalance[token][msg.sender] +amount;


}
function addAllowedTokens(address token) public onlyOwner 
{
s_allowedTokens.push(token);
}

function tokenIsAllowed(address token) public returns(bool) 
{
for(uint256 allowedTokensIndex =0;allowedTokensIndex<s_allowedTokens.length;allowedTokensIndex++)
{
if(s_allowedTokens[allowedTokensIndex]==token){
    return true;
}
}
return false;
}
}