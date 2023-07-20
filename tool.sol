//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract pianoroleC12{
    function getBalance(address user) public view returns(uint){
        return user.balance;
    }
    function getBlockNumber() public view returns(uint){
        return block.number;
    }
    function getLastBlockHash() public view returns (bytes32 blockHash) {
        uint preblock = block.number - 1;
        blockHash = blockhash(preblock);
    }
    function gethash() public view returns(bytes32 blocks){
        blocks = blockhash(getBlockNumber());
    }
    function getTimestamp() public view returns(uint){
        return block.timestamp;
    }
    function getDifficulty() public view returns(uint){
        return block.difficulty;
    }
    function getGasLimit() public view returns(uint){
        return block.gaslimit;
    }
    function getCoinbase() public view returns(address){
        return block.coinbase;
    }
}
