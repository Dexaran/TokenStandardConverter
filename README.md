# Ethereum Token Converter

This service is created to introduce "cross-standard" interoperability of tokens on Ethereum and EVM-compatible chains.

The most used Ethereum fungible token standard is [ERC-20](https://eips.ethereum.org/EIPS/eip-20) and this standard is quite old. Therefore it is necessary to introduce a clear procedure of "standard upgrade" without requiring redeploying of existing token contracts. The Token Converter smart-contract can be exactly the tool that ensures smooth transition from the old standard to a newer one.

This particular implementation converts [ERC-20](https://eips.ethereum.org/EIPS/eip-20) tokens to [ERC-223](https://eips.ethereum.org/EIPS/eip-223) tokens. ERC-223 tokens can be converted back to the ERC-20 origin anytime.

# Deployment

Converter v3: https://explorer.callisto.network/address/0xc68AD4DDCB3C9cAd52852E6dF7102b77c32865A5/transactions
