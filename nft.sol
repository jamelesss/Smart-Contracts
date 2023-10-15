// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable(msg.sender) {
    uint256 public mintPrice = 0.00005 ether;
    struct certificate {
        string name;
        string content;
    }

    mapping(uint256 => certificate) public certificates;

    constructor() ERC721("CertificateNFT", "certNFT") {
        // Set the name and symbol for your NFT.
    }

    function mintCertificate(address recipient, uint256 tokenId, string memory name, string memory content) public onlyOwner {
        _mint(recipient, tokenId);
        certificates[tokenId] = certificate(name, content);
    }
}
