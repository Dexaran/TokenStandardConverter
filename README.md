# Ethereum Token Converter

This service is created to introduce "cross-standard" interoperability of tokens on Ethereum and EVM-compatible chains.

The most used Ethereum fungible token standard is [ERC-20](https://eips.ethereum.org/EIPS/eip-20) and this standard is quite old. Therefore it is necessary to introduce a clear procedure of "standard upgrade" without requiring redeploying of existing token contracts. The Token Converter smart-contract can be exactly the tool that ensures smooth transition from the old standard to a newer one.

This particular implementation converts [ERC-20](https://eips.ethereum.org/EIPS/eip-20) tokens to [ERC-223](https://eips.ethereum.org/EIPS/eip-223) tokens. ERC-223 tokens can be converted back to the ERC-20 origin anytime.

# Deployment

Converter v4 (CLO mainnet): https://explorer.callisto.network/address/0xf0ddb84596C9B52981C2bFf35c8B21d2b8FEd64c/transactions

Ethereum Mainnet v4: https://etherscan.io/address/0x1e9d6cba29e4aa4a9e2587b19d3f0e68de9b6552

# Creation codes for wrapper tokens (required by DEXes)

Compiled with v0.8.19+commit.7dd6d404 5000 optimization runs as deployed on ETH mainnet at [0xe7E969012557f25bECddB717A3aa2f4789ba9f9a](https://etherscan.io/address/0xe7E969012557f25bECddB717A3aa2f4789ba9f9a#code)

ERC-20:

```
0x6080604052600180546001600160a01b03199081167301000b5fe61411c466b70631d7ff070187179bbf17909155600280549091163317905534801561004457600080fd5b506100556301ffc9a760e01b61005a565b6100dd565b6001600160e01b031980821690036100b85760405162461bcd60e51b815260206004820152601c60248201527f4552433136353a20696e76616c696420696e7465726661636520696400000000604482015260640160405180910390fd5b6001600160e01b0319166000908152602081905260409020805460ff19166001179055565b61101e806100ec6000396000f3fe608060405234801561001057600080fd5b50600436106101365760003560e01c806340c10f19116100b257806395d89b4111610081578063a9059cbb11610066578063a9059cbb14610298578063d3d2bfda146102ab578063dd62ed3e146102be57600080fd5b806395d89b411461027d5780639dc29fac1461028557600080fd5b806340c10f191461021d57806370a08231146102305780638cd4426d14610259578063938b5f321461026c57600080fd5b806318160ddd1161010957806323b872dd116100ee57806323b872dd146101db5780632801617e146101ee578063313ce5671461020357600080fd5b806318160ddd146101b657806319d16c49146101c857600080fd5b806301ffc9a71461013b57806302d05d3f1461016357806306fdde031461018e578063095ea7b3146101a3575b600080fd5b61014e610149366004610ca5565b6102f7565b60405190151581526020015b60405180910390f35b600254610176906001600160a01b031681565b6040516001600160a01b03909116815260200161015a565b6101966103cc565b60405161015a9190610d12565b61014e6101b1366004610d61565b61045c565b6005545b60405190815260200161015a565b600154610176906001600160a01b031681565b61014e6101e9366004610d8b565b610538565b6102016101fc366004610dc7565b6106b0565b005b61020b610701565b60405160ff909116815260200161015a565b61020161022b366004610d61565b610788565b6101ba61023e366004610dc7565b6001600160a01b031660009081526006602052604090205490565b610201610267366004610d61565b6108d3565b6003546001600160a01b0316610176565b6101966108ef565b610201610293366004610d61565b61099e565b61014e6102a6366004610d61565b610aa9565b600354610176906001600160a01b031681565b6101ba6102cc366004610de2565b6001600160a01b03918216600090815260046020908152604080832093909416825291909152205490565b60007fffffffff0000000000000000000000000000000000000000000000000000000082167f36372b0700000000000000000000000000000000000000000000000000000000148061038a57507fffffffff0000000000000000000000000000000000000000000000000000000082167f809d3ae700000000000000000000000000000000000000000000000000000000145b806103c657507fffffffff00000000000000000000000000000000000000000000000000000000821660009081526020819052604090205460ff165b92915050565b600354604080517f06fdde0300000000000000000000000000000000000000000000000000000000815290516060926001600160a01b0316916306fdde039160048083019260009291908290030181865afa15801561042f573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f191682016040526104579190810190610e44565b905090565b60006001600160a01b0383166104d3576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601560248201527f45524332303a205370656e646572206572726f722e000000000000000000000060448201526064015b60405180910390fd5b3360008181526004602090815260408083206001600160a01b03881680855290835292819020869055518581529192917f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92591015b60405180910390a350600192915050565b6001600160a01b03831660009081526004602090815260408083203384529091528120548211156105c5576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601e60248201527f45524332303a20496e73756666696369656e7420616c6c6f77616e63652e000060448201526064016104ca565b6001600160a01b038416600090815260066020526040812080548492906105ed908490610f20565b90915550506001600160a01b038416600090815260046020908152604080832033845290915281208054849290610625908490610f20565b90915550506001600160a01b03831660009081526006602052604081208054849290610652908490610f33565b92505081905550826001600160a01b0316846001600160a01b03167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef8460405161069e91815260200190565b60405180910390a35060019392505050565b6002546001600160a01b031633146106c757600080fd5b600380547fffffffffffffffffffffffff0000000000000000000000000000000000000000166001600160a01b0392909216919091179055565b600354604080517f313ce56700000000000000000000000000000000000000000000000000000000815290516000926001600160a01b03169163313ce5679160048083019260209291908290030181865afa158015610764573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906104579190610f46565b6002546001600160a01b03163314610848576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152604160248201527f5772617070657220546f6b656e3a204f6e6c79207468652063726561746f722060448201527f636f6e74726163742063616e206d696e74207772617070657220746f6b656e7360648201527f2e00000000000000000000000000000000000000000000000000000000000000608482015260a4016104ca565b6001600160a01b03821660009081526006602052604081208054839290610870908490610f33565b9250508190555080600560008282546108899190610f33565b90915550506040518181526001600160a01b038316906000907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a35050565b6001546108eb9083906001600160a01b031683610b42565b5050565b600354604080517f95d89b4100000000000000000000000000000000000000000000000000000000815290516060926001600160a01b0316916395d89b419160048083019260009291908290030181865afa158015610952573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f1916820160405261097a9190810190610e44565b60405160200161098a9190610f69565b604051602081830303815290604052905090565b6002546001600160a01b03163314610a5f576040517f08c379a0000000000000000000000000000000000000000000000000000000008152602060048201526044602482018190527f5772617070657220546f6b656e3a204f6e6c79207468652063726561746f7220908201527f636f6e74726163742063616e2064657374726f79207772617070657220746f6b60648201527f656e732e00000000000000000000000000000000000000000000000000000000608482015260a4016104ca565b6001600160a01b03821660009081526006602052604081208054839290610a87908490610f20565b925050819055508060056000828254610aa09190610f20565b90915550505050565b33600090815260066020526040812054610ac4908390610f20565b33600090815260066020526040808220929092556001600160a01b03851681522054610af1908390610f33565b6001600160a01b0384166000818152600660205260409081902092909255905133907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef906105279086815260200190565b604080516001600160a01b038481166024830152604480830185905283518084039091018152606490920183526020820180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167fa9059cbb000000000000000000000000000000000000000000000000000000001790529151600092839290871691610bcc9190610faa565b6000604051808303816000865af19150503d8060008114610c09576040519150601f19603f3d011682016040523d82523d6000602084013e610c0e565b606091505b5091509150818015610c38575080511580610c38575080806020019051810190610c389190610fc6565b610c9e576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f5472616e7366657248656c7065723a205452414e534645525f4641494c45440060448201526064016104ca565b5050505050565b600060208284031215610cb757600080fd5b81357fffffffff0000000000000000000000000000000000000000000000000000000081168114610ce757600080fd5b9392505050565b60005b83811015610d09578181015183820152602001610cf1565b50506000910152565b6020815260008251806020840152610d31816040850160208701610cee565b601f01601f19169190910160400192915050565b80356001600160a01b0381168114610d5c57600080fd5b919050565b60008060408385031215610d7457600080fd5b610d7d83610d45565b946020939093013593505050565b600080600060608486031215610da057600080fd5b610da984610d45565b9250610db760208501610d45565b9150604084013590509250925092565b600060208284031215610dd957600080fd5b610ce782610d45565b60008060408385031215610df557600080fd5b610dfe83610d45565b9150610e0c60208401610d45565b90509250929050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b600060208284031215610e5657600080fd5b815167ffffffffffffffff80821115610e6e57600080fd5b818401915084601f830112610e8257600080fd5b815181811115610e9457610e94610e15565b604051601f8201601f19908116603f01168101908382118183101715610ebc57610ebc610e15565b81604052828152876020848701011115610ed557600080fd5b610ee6836020830160208801610cee565b979650505050505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b818103818111156103c6576103c6610ef1565b808201808211156103c6576103c6610ef1565b600060208284031215610f5857600080fd5b815160ff81168114610ce757600080fd5b60008251610f7b818460208701610cee565b7f3230000000000000000000000000000000000000000000000000000000000000920191825250600201919050565b60008251610fbc818460208701610cee565b9190910192915050565b600060208284031215610fd857600080fd5b81518015158114610ce757600080fdfea2646970667358221220e97d1031a2ac6100b71c279bbb8287919b290b83e83d32e852bee9845fc0aeb064736f6c63430008130033
```


ERC-223:

```
0x6080604052600180546001600160a01b03199081167301000b5fe61411c466b70631d7ff070187179bbf17909155600280549091163317905534801561004457600080fd5b506100556301ffc9a760e01b61005a565b6100dd565b6001600160e01b031980821690036100b85760405162461bcd60e51b815260206004820152601c60248201527f4552433136353a20696e76616c696420696e7465726661636520696400000000604482015260640160405180910390fd5b6001600160e01b0319166000908152602081905260409020805460ff19166001179055565b61153a806100ec6000396000f3fe6080604052600436106101445760003560e01c806340c10f19116100c0578063938b5f3211610074578063a9059cbb11610059578063a9059cbb14610385578063be45fd62146103a5578063dd62ed3e146103b857600080fd5b8063938b5f321461035257806395d89b411461037057600080fd5b80635a3b7e42116100a55780635a3b7e42146102e057806370a08231146102fc5780638cd4426d1461033257600080fd5b806340c10f19146102a057806342966c68146102c057600080fd5b806318160ddd1161011757806323b872dd116100fc57806323b872dd146102375780632801617e14610257578063313ce5671461027957600080fd5b806318160ddd146101f857806319d16c491461021757600080fd5b806301ffc9a71461014957806302d05d3f1461017e57806306fdde03146101b6578063095ea7b3146101d8575b600080fd5b34801561015557600080fd5b50610169610164366004611072565b6103fe565b60405190151581526020015b60405180910390f35b34801561018a57600080fd5b5060025461019e906001600160a01b031681565b6040516001600160a01b039091168152602001610175565b3480156101c257600080fd5b506101cb6104d3565b60405161017591906110e6565b3480156101e457600080fd5b506101696101f3366004611115565b610563565b34801561020457600080fd5b506005545b604051908152602001610175565b34801561022357600080fd5b5060015461019e906001600160a01b031681565b34801561024357600080fd5b5061016961025236600461113f565b61063e565b34801561026357600080fd5b5061027761027236600461117b565b6107b6565b005b34801561028557600080fd5b5061028e610807565b60405160ff9091168152602001610175565b3480156102ac57600080fd5b506102776102bb366004611115565b61088e565b3480156102cc57600080fd5b506102776102db366004611196565b6109d9565b3480156102ec57600080fd5b5060405160df8152602001610175565b34801561030857600080fd5b5061020961031736600461117b565b6001600160a01b031660009081526006602052604090205490565b34801561033e57600080fd5b5061027761034d366004611115565b610ada565b34801561035e57600080fd5b506003546001600160a01b031661019e565b34801561037c57600080fd5b506101cb610af6565b34801561039157600080fd5b506101696103a0366004611115565b610ba5565b6101696103b33660046111af565b610cf7565b3480156103c457600080fd5b506102096103d3366004611236565b6001600160a01b03918216600090815260046020908152604080832093909416825291909152205490565b60007fffffffff0000000000000000000000000000000000000000000000000000000082167f3ed8c78500000000000000000000000000000000000000000000000000000000148061049157507fffffffff0000000000000000000000000000000000000000000000000000000082167fddef4e1000000000000000000000000000000000000000000000000000000000145b806104cd57507fffffffff00000000000000000000000000000000000000000000000000000000821660009081526020819052604090205460ff165b92915050565b600354604080517f06fdde0300000000000000000000000000000000000000000000000000000000815290516060926001600160a01b0316916306fdde039160048083019260009291908290030181865afa158015610536573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f1916820160405261055e9190810190611298565b905090565b60006001600160a01b0383166105da576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601660248201527f4552433232333a205370656e646572206572726f722e0000000000000000000060448201526064015b60405180910390fd5b3360008181526004602090815260408083206001600160a01b03881680855290835292819020869055518581529192917f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925910160405180910390a350600192915050565b6001600160a01b03831660009081526004602090815260408083203384529091528120548211156106cb576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f4552433232333a20496e73756666696369656e7420616c6c6f77616e63652e0060448201526064016105d1565b6001600160a01b038416600090815260066020526040812080548492906106f3908490611374565b90915550506001600160a01b03841660009081526004602090815260408083203384529091528120805484929061072b908490611374565b90915550506001600160a01b03831660009081526006602052604081208054849290610758908490611387565b92505081905550826001600160a01b0316846001600160a01b03167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040516107a491815260200190565b60405180910390a35060019392505050565b6002546001600160a01b031633146107cd57600080fd5b600380547fffffffffffffffffffffffff0000000000000000000000000000000000000000166001600160a01b0392909216919091179055565b600354604080517f313ce56700000000000000000000000000000000000000000000000000000000815290516000926001600160a01b03169163313ce5679160048083019260209291908290030181865afa15801561086a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061055e919061139a565b6002546001600160a01b0316331461094e576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152604160248201527f5772617070657220546f6b656e3a204f6e6c79207468652063726561746f722060448201527f636f6e74726163742063616e206d696e74207772617070657220746f6b656e7360648201527f2e00000000000000000000000000000000000000000000000000000000000000608482015260a4016105d1565b6001600160a01b03821660009081526006602052604081208054839290610976908490611387565b92505081905550806005600082825461098f9190611387565b90915550506040518181526001600160a01b038316906000907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a35050565b6002546001600160a01b03163314610a9a576040517f08c379a0000000000000000000000000000000000000000000000000000000008152602060048201526044602482018190527f5772617070657220546f6b656e3a204f6e6c79207468652063726561746f7220908201527f636f6e74726163742063616e2064657374726f79207772617070657220746f6b60648201527f656e732e00000000000000000000000000000000000000000000000000000000608482015260a4016105d1565b3360009081526006602052604081208054839290610ab9908490611374565b925050819055508060056000828254610ad29190611374565b909155505050565b600154610af29083906001600160a01b031683610ede565b5050565b600354604080517f95d89b4100000000000000000000000000000000000000000000000000000000815290516060926001600160a01b0316916395d89b419160048083019260009291908290030181865afa158015610b59573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f19168201604052610b819190810190611298565b604051602001610b9191906113bd565b604051602081830303815290604052905090565b60408051808201825260048152600060208083018290523382526006905291822054610bd2908490611374565b33600090815260066020526040808220929092556001600160a01b03861681522054610bff908490611387565b6001600160a01b038516600090815260066020526040902055833b15610cad576040517f8943ec020000000000000000000000000000000000000000000000000000000081526001600160a01b03851690638943ec0290610c68903390879086906004016113fe565b6020604051808303816000875af1158015610c87573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610cab919061142f565b505b6040518381526001600160a01b0385169033907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a35060019392505050565b33600090815260066020526040812054610d12908590611374565b33600090815260066020526040808220929092556001600160a01b03871681522054610d3f908590611387565b6001600160a01b0386166000908152600660205260409020553415610dc357600080866001600160a01b03163460405160006040518083038185875af1925050503d8060008114610dac576040519150601f19603f3d011682016040523d82523d6000602084013e610db1565b606091505b509150915081610dc057600080fd5b50505b843b15610e5a576040517f8943ec020000000000000000000000000000000000000000000000000000000081526001600160a01b03861690638943ec0290610e15903390889088908890600401611477565b6020604051808303816000875af1158015610e34573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610e58919061142f565b505b6040518481526001600160a01b0386169033907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a37f3ba9136826ac751de05d770d8d34fa4440ada49a5fb0e9aa1678aece66dad9768383604051610ecb9291906114aa565b60405180910390a1506001949350505050565b604080516001600160a01b038481166024830152604480830185905283518084039091018152606490920183526020820180517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff167fa9059cbb000000000000000000000000000000000000000000000000000000001790529151600092839290871691610f6891906114c6565b6000604051808303816000865af19150503d8060008114610fa5576040519150601f19603f3d011682016040523d82523d6000602084013e610faa565b606091505b5091509150818015610fd4575080511580610fd4575080806020019051810190610fd491906114e2565b61103a576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601f60248201527f5472616e7366657248656c7065723a205452414e534645525f4641494c45440060448201526064016105d1565b5050505050565b7fffffffff000000000000000000000000000000000000000000000000000000008116811461106f57600080fd5b50565b60006020828403121561108457600080fd5b813561108f81611041565b9392505050565b60005b838110156110b1578181015183820152602001611099565b50506000910152565b600081518084526110d2816020860160208601611096565b601f01601f19169290920160200192915050565b60208152600061108f60208301846110ba565b80356001600160a01b038116811461111057600080fd5b919050565b6000806040838503121561112857600080fd5b611131836110f9565b946020939093013593505050565b60008060006060848603121561115457600080fd5b61115d846110f9565b925061116b602085016110f9565b9150604084013590509250925092565b60006020828403121561118d57600080fd5b61108f826110f9565b6000602082840312156111a857600080fd5b5035919050565b600080600080606085870312156111c557600080fd5b6111ce856110f9565b935060208501359250604085013567ffffffffffffffff808211156111f257600080fd5b818701915087601f83011261120657600080fd5b81358181111561121557600080fd5b88602082850101111561122757600080fd5b95989497505060200194505050565b6000806040838503121561124957600080fd5b611252836110f9565b9150611260602084016110f9565b90509250929050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b6000602082840312156112aa57600080fd5b815167ffffffffffffffff808211156112c257600080fd5b818401915084601f8301126112d657600080fd5b8151818111156112e8576112e8611269565b604051601f8201601f19908116603f0116810190838211818310171561131057611310611269565b8160405282815287602084870101111561132957600080fd5b61133a836020830160208801611096565b979650505050505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b818103818111156104cd576104cd611345565b808201808211156104cd576104cd611345565b6000602082840312156113ac57600080fd5b815160ff8116811461108f57600080fd5b600082516113cf818460208701611096565b7f3232330000000000000000000000000000000000000000000000000000000000920191825250600301919050565b6001600160a01b038416815282602082015260606040820152600061142660608301846110ba565b95945050505050565b60006020828403121561144157600080fd5b815161108f81611041565b818352818160208501375060006020828401015260006020601f19601f840116840101905092915050565b6001600160a01b03851681528360208201526060604082015260006114a060608301848661144c565b9695505050505050565b6020815260006114be60208301848661144c565b949350505050565b600082516114d8818460208701611096565b9190910192915050565b6000602082840312156114f457600080fd5b8151801515811461108f57600080fdfea2646970667358221220792f0f0603c575622971125598346cae31eefaa8958ce1751c1206676bb1d60d64736f6c63430008130033
```
