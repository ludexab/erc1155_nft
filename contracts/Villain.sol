//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Villain is ERC1155, Ownable {
    uint256 public constant MY_NFT = 0;
    string public name = "Villain County";

    constructor() public ERC1155("https://a69nvnc2nuyk.usemoralis.com/{id}.json") {
        _mint(msg.sender, MY_NFT, 1, "");
    }

    function mint(address to, uint256 id, uint256 amount) public onlyOwner {
        _mint(to, id, amount, "");
    }

    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }

}
