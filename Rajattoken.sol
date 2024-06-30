// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PramodToken is ERC20 {
    address public admin;

    constructor(uint256 initialSupply) ERC20("Pramod", "PRM") {
        _mint(msg.sender, initialSupply);
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Error: Caller is not the administrator");
        _;
    }

    function mint(address to, uint256 amount) external onlyAdmin {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }
}
