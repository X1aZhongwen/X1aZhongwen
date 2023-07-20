// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "../IERC20.sol";

contract Faucet{
    uint256 private immutable amountAllowed = 100;
    address tokenContract;
    mapping(address => bool)public requestedAddress;
    mapping(address => uint256)public _balances;
    // SendToken事件    
    event SendToken(address indexed Receiver, uint256 indexed Amount);
    // 部署时设定ERC2代币合约
    constructor(address _tokenContract) {
        tokenContract = _tokenContract; // set token contract
    }
// 用户领取代币函数
    function requestTokens() external {
        require(requestedAddress[msg.sender] == false, "Can't Request Multiple Times!"); // 每个地址只能领一次
        IERC20 token = IERC20(tokenContract); //创建IERC20合约对象
        require(token.balanceOf(tokenContract) >= amountAllowed, "Faucet Empty!"); // 水龙头空了

        token.transfer(msg.sender, amountAllowed); // 发送token
        requestedAddress[msg.sender] = true; // 记录领取地址
    
        emit SendToken(msg.sender, amountAllowed); // 释放SendToken事件
    }
}
