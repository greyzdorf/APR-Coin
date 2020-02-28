/* 

*Submitted for verification at Etherscan.io on 2019-11-12
*Deployed to Ethereum Mainnet on 28-02-2020
*Developed by the Technical Team of Greyzdorf BTR LLC

Backed By : Glass Apple Farm Property
Valuation : $8.5 Million - 27-02-2020
Ticker : APR
TotalSupply : Variable Supply
Decimal : 0
Burning : available
Minting : available
Whitelisting : available
Freeze : available
Type of Asset : Real Estate Backed

*/

pragma solidity ^ 0.6.3;

/* SafeMath functions */

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

contract APR is SafeMath {
    
     constructor() public{
        uint256 initalSupply = 0;
        owner = msg.sender;
        balanceOf[msg.sender]=initalSupply;
        totalSupply+=initalSupply;
     }
    
    string public constant name = "Glass Apple Estate";
    string public constant symbol = "APR";
    uint256 public constant decimals = 0;
    uint256 public totalSupply = 0;
    uint256 public constant version = "1";
    address public owner;
    uint256 public lendersCount;
    
    struct Lenders{
        address LenderId;
        bool verified;
        string name;
    }

    mapping (address => uint256) public balanceOf;
    mapping (address => uint256) public freezeOf;
    mapping (address => Lenders) lenders;
    event Transfer(address indexed from, address indexed to, uint256 value);

    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
    
    function createLender(string memory _name,address _lender) public onlyOwner returns (bool){
        Lenders storage lender = lenders[_lender];
        if(lender.LenderId != _lender){
        lender.LenderId = _lender;
        lender.name = _name;
        lender.verified = true;
        lendersCount++;
        return true;
        }
        else return false;
     }
    
    function fetchLender(address _address)public view returns(string memory, bool){
        Lenders storage lender = lenders[_address];
        if(lender.LenderId==_address){
            return(lender.name,lender.verified);
        }
        else if(_address == owner){
            return("Owner of Property",false);
        }
        else return("No Lender Found",false);
    }
    
    function disableLender(address _lender) public onlyOwner returns(bool){
        Lenders storage lender = lenders[_lender];
        if(lender.LenderId == _lender){
            lender.verified = false;
            lendersCount--;
            return true;
        }
        else return false;
    }
    
    function enableLender(address _lender) public onlyOwner returns(bool){
        Lenders storage lender = lenders[_lender];
        if(lender.LenderId == _lender){
            lender.verified = true;
            lendersCount++;
            return true;
        }
        else return false;
    }
    
    function mint(uint256 _value) public onlyOwner returns (bool){
        balanceOf[msg.sender] = SafeMath.safeAdd(balanceOf[msg.sender],_value);
        totalSupply = SafeMath.safeAdd(totalSupply,_value);
        return true;
    }
    
    function burn(uint256 _value) public onlyOwner returns (bool success){
        if(balanceOf[msg.sender]>=_value){
            balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender],_value);
            totalSupply = SafeMath.safeSub(totalSupply,_value);
            return true;
        }
        else return false;
    }
    
    function transfer(address _reciever, uint256 _value) public returns (string memory){
         Lenders storage lender = lenders[_reciever];
        if(balanceOf[msg.sender]>=_value && lender.verified==true){
            balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender],_value);
            balanceOf[_reciever] = SafeMath.safeAdd(balanceOf[_reciever],_value);
            return("Transaction Success");
        }
        else return("Transaction Failed");
    }
    
    function freeze(address _lender, uint256 _value)  public onlyOwner returns (bool){
        if(balanceOf[_lender]>=_value){
            balanceOf[_lender] = SafeMath.safeSub(balanceOf[_lender],_value);
            freezeOf[_lender] = SafeMath.safeAdd(freezeOf[_lender],_value);
            return true;
        }
        else return false;
        
    }
    
    function Unfreeze(address _lender,uint256 _value) public onlyOwner returns (bool){
        if(freezeOf[_lender]>=_value){
            balanceOf[_lender] = SafeMath.safeAdd(balanceOf[_lender],_value);
            freezeOf[_lender] = SafeMath.safeSub(balanceOf[_lender],_value);
            return true;
        }
        else  return false;
    }
    
}

