// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ROYToken is ERC20 {
    uint256 constant _maxSupply = 21000000;

    constructor() ERC20("Roy", "ROY") {
        _mint(msg.sender, _maxSupply);
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, 1000);
    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        _mintMinerReward();
        super._beforeTokenTransfer(from, to, value);
    }
} 