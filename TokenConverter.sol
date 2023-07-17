// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/ERC223.sol";

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}



/**
    ERC-223 Wrapper is a token that is created by the TokenConverter contract
    and can be exchanged 1:1 for it's original ERC-20 version at any time
    this version implements `approve` and `transferFrom` features for backwards compatibility reasons
    even though we do not recommend using this pattern to transfer ERC-223 tokens.
*/
contract ERC223WrapperToken is ERC223Token
{
    address public creator = msg.sender;
    address public wrapper_for;
    
    constructor(address _wrapper_for, string memory new_name, string memory new_symbol, uint8 new_decimals) ERC223Token(new_name, new_symbol, new_decimals)
    {
        wrapper_for = _wrapper_for;
    }

    function name() public view override returns (string memory) { return IERC223(wrapper_for).name(); }
    function symbol() public view override returns (string memory) { return IERC223(wrapper_for).symbol(); }
    function decimals() public view override returns (uint8) { return IERC223(wrapper_for).decimals(); }
    
    function origin() public view returns (address)
    {
        return wrapper_for;
    }

    function mint(address _recipient, uint256 _quantity) external
    {
        require(msg.sender == creator, "Only the creator contract can mint wrapper tokens.");
    }

    function burn(uint256 _quantity) external
    {
        require(msg.sender == creator, "Only the creator contract can destroy wrapper tokens.");
    }
}

contract TokenStandardConverter is IERC223Recipient
{
    mapping (address => ERC223WrapperToken) public erc223Wrappers; // A list of token wrappers. First one is ERC-20 origin, second one is ERC-223 version.
    mapping (address => address) public erc20Origins;

    function getWrapperFor(address _erc20Token) public view returns (address)
    {
        return address(erc223Wrappers[_erc20Token]);
    }

    function getOriginFor(address _erc223WrappedToken) public view returns (address)
    {
        return erc20Origins[_erc223WrappedToken];
    }

    function tokenReceived(address _from, uint _value, bytes memory _data) public override returns (bytes4)
    {
        require(erc20Origins[msg.sender] != address(0), "ERROR: The received token is not a ERC-223 Wrapper for any ERC-20 token.");
        IERC20(erc20Origins[msg.sender]).transfer(_from, _value);
        return 0x8943ec02;
    }

    function createERC223Wrapper(address _erc20Token) public returns (bool)
    {
        require(address(erc223Wrappers[_erc20Token]) == address(0), "ERROR: Wrapper already exists.");

        ERC223WrapperToken _newERC223Wrapper     = new ERC223WrapperToken(_erc20Token, "ERC-223-Wrapper", "Wrapped Token", 18);
        erc223Wrappers[_erc20Token]              = _newERC223Wrapper;
        erc20Origins[address(_newERC223Wrapper)] = _erc20Token;

        return true;
    }

    function convertERC20toERC223(address _ERC20token, uint256 _amount) public returns (bool)
    {
        require(address(erc223Wrappers[_ERC20token]) != address(0), "ERROR: ERC-223 wrapper for this ERC-20 token does not exist yet.");
        IERC20(_ERC20token).transferFrom(msg.sender, address(this), _amount);
        erc223Wrappers[_ERC20token].mint(msg.sender, _amount);
        return true;
    }

    function convertERC223toERC20(address _ERC223token, uint256 _amount) public returns (bool)
    {

    }
}
