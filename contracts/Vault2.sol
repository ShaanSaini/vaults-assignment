//SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.4;

contract Vault2 is ERC20, Ownable {
    
    // Events
    event Mint(uint amount);
    event Burn(uint amount);

    constructor() ERC20("Vault2", "VAULT") {}

    function mint(_amount) external payable onlyOwner {
        require(_amount == msg.value, "amount does not equal to msg.value");
        _mint(msg.sender, _amount);
        emit Mint(_amount);
    }

    function burn(_amount) external payable onlyOwner {
        _burn(msg.sender, _amount);
        (bool _success,) = msg.sender.call{value: _amount}("");
        require(success, "Withdraw failed");
        emit Burn(_amount);
    }
}
