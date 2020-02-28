# APR Backed by Glass Apple Estate - $ 8.5 million USD

> Asset backed Securities Developed by Greyzdorf BTR LLC

<img src="https://www.greyzdorf.io/images/svg/apr.svg" style="margin-left:20px" width="220" height="220" />

> [More Information](https://exchange.greyzdorf.io/listed/apr)

This repo consists of the smart contract for the APR digital share issued by Greyzdorf BTR LLC on 28-02-2020, backing the property Glass Apple Estate, Alto, Georgia.

### Specification of the Property & Digital Share (APR) :

- Written in : Solidity v6.0.3 (Latest by this time)<br />
- Blockchain : Ethereum<br />
- Backed By : Glass Apple Farm Property<br />
- Valuation : $8.5 Million - 27-02-2020<br />
- Ticker : APR<br />
- TotalSupply : Variable Supply<br />
- Decimal : 0<br />
- Burning : available<br />
- Minting : available<br />
- Whitelisting : available<br />
- Freeze : available<br />
- Type of Asset : Real Estate Backed<br />

### Need for the digital Share :

1. *Providing Flexiblity for Fractional Digital Lending in Real Estate
1. *High-Transparency & Decentralization

### Benefits of HODL :

1. **6-12%** Annual Interest Rates secured by real-estate
1. Making blockchain lending much simpler & risk-free

### Features of Smart Contract :

1. Decentralized Lender Database 
1. Minting & Burning to ensure that it stays intact with lending amount
1. Freeze & Whitelisting features to prevent AML
1. Exclusive Lender adding & removal features

### SafeMath Function:
```solidity
contract SafeMath {
    
  function safeMul(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function safeSub(uint256 a, uint256 b) pure internal returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) pure internal returns (uint256) {
    uint256 c = a + b;
    assert(c>=a && c>=b);
    return c;
  }

}
```

### Contributors
Developed by Greyzdorf BTR LLC Technical Team on 28-02-2020
