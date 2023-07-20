// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/token/ERC223/IERC223Recipient.sol";
import "https://github.com/Dexaran/ERC223-token-standard/blob/development/utils/Address.sol";

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
contract ERC223WrapperToken is IERC223
{
    address public creator = msg.sender;
    address public wrapper_for;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event TransferData(bytes data);

    constructor(address _wrapper_for)
    {
        wrapper_for = _wrapper_for;
    }
    uint256 private _totalSupply;
    
    mapping(address => uint256) public balances; // List of user balances.

    function totalSupply() public view override returns (uint256)             { return _totalSupply; }
    function balanceOf(address _owner) public view override returns (uint256) { return balances[_owner]; }

    function transfer(address _to, uint _value, bytes calldata _data) public override returns (bool success)
    {
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _data);
        }
        //emit Transfer(msg.sender, _to, _value, _data);
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_data);
        return true;
    }
    function transfer(address _to, uint _value) public override returns (bool success)
    {
        bytes memory _empty = hex"00000000";
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _empty);
        }
        //emit Transfer(msg.sender, _to, _value, _empty);
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_empty);
        return true;
    }

    function name() public view override returns (string memory)   { return IERC223(wrapper_for).name(); }
    function symbol() public view override returns (string memory) { return IERC223(wrapper_for).symbol(); }
    function decimals() public view override returns (uint8)       { return IERC223(wrapper_for).decimals(); }
    function origin() public view returns (address)                { return wrapper_for; }

    function mint(address _recipient, uint256 _quantity) external
    {
        require(msg.sender == creator, "Only the creator contract can mint wrapper tokens.");
        balances[_recipient] += _quantity;
        _totalSupply += _quantity;
    }

    function burn(uint256 _quantity) external
    {
        require(msg.sender == creator, "Only the creator contract can destroy wrapper tokens.");
        balances[msg.sender] -= _quantity;
        _totalSupply -= _quantity;
    }
}

contract TokenStandardConverter is IERC223Recipient
{
    address public ownerMultisig;

    mapping (address => ERC223WrapperToken) public erc223Wrappers; // A list of token wrappers. First one is ERC-20 origin, second one is ERC-223 version.
    mapping (address => address) public erc20Origins;
    mapping (address => uint256) public erc20Supply; // Token => how much was deposited.

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

        erc223Wrappers[msg.sender].burn(_value);

        return 0x8943ec02;
    }

    function createERC223Wrapper(address _erc20Token) public returns (bool)
    {
        require(address(erc223Wrappers[_erc20Token]) == address(0), "ERROR: Wrapper already exists.");

        ERC223WrapperToken _newERC223Wrapper     = new ERC223WrapperToken(_erc20Token);
        erc223Wrappers[_erc20Token]              = _newERC223Wrapper;
        erc20Origins[address(_newERC223Wrapper)] = _erc20Token;

        return true;
    }

    function convertERC20toERC223(address _ERC20token, uint256 _amount) public returns (bool)
    {
        require(address(erc223Wrappers[_ERC20token]) != address(0), "ERROR: ERC-223 wrapper for this ERC-20 token does not exist yet.");
        bool _result = IERC20(_ERC20token).transferFrom(msg.sender, address(this), _amount);
        if(!_result) revert(); // Safety check for tokens that return `false` on failed transfer like TheDAO token.
        erc20Supply[_ERC20token] += _amount;

        erc223Wrappers[_ERC20token].mint(msg.sender, _amount);

        return true;
    }

/* This is done via `tokenReceived` fallback function of the ERC-223 deposit.
    function convertERC223toERC20(address _ERC223token, uint256 _amount) public returns (bool)
    {
        require(address(erc223Wrappers[_ERC20token]) != address(0), "ERROR: ERC-223 wrapper for this ERC-20 token does not exist yet.");
    }
*/

    function rescueERC20(address _token) external {
        require(msg.sender == ownerMultisig, "ERROR: Only owner can do this.");
        uint256 _stuckTokens = IERC20(_token).balanceOf(address(this)) - erc20Supply[_token];
        IERC20(_token).transfer(msg.sender, _stuckTokens);
    }

    function transferOwnership(address _newOwner) public
    {
        require(msg.sender == ownerMultisig, "ERROR: Only owner can do this.");
        ownerMultisig = _newOwner;
    }
}
