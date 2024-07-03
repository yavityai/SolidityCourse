// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract MyShop {

    address public owner;
    mapping (address => uint) public payments;

    // Конструктор вызывается автоматически и однократно в момент размещения контракта в блокчейне
    constructor()
    {
        // msg - специальный глобальный объект (транзакция)
        //переменная помещеается в блокчейн
        owner = msg.sender; // тот, кто развернул, тот и владелец

    }

    function payForItem () public payable  {
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable  _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}

