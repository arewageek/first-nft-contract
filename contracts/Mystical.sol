// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Votes.sol";

contract MyToken is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Pausable, Ownable, EIP712, ERC721Votes {
    uint256 private _nextTokenId;
    string private _baseUri = "https://indigo-adorable-goldfish-834.mypinata.cloud/ipfs/QmWDQTYXXMsduJDAFCzrbSs5bDRFt8FHqRYEc3S6mh24oe/";

    constructor(address initialOwner, string memory _tokenName, string memory _ticker)
        ERC721(_tokenName, _ticker)
        Ownable(initialOwner)
        EIP712(_tokenName, "1")
    {
        // _baseUri = baseUri;
    }

    function _baseURI() internal override view returns (string memory) {
        return _baseUri;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function publicMint(string memory uri) public payable {
        require(msg.value == 0.01 ether, "Not enough Ethers");
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable, ERC721Votes)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable, ERC721Votes)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    // custom contract functions

}