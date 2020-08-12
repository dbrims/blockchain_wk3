pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable public employee_one; 
    address payable public employee_two; 
    address payable public employee_three; 

//define the addresses for the payees
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

//access the balance on the contract (should be zero)
    function balance() public view returns(uint) {
        return address(this).balance;
    }

//Accept the payment and distribute it to the payees acounding to set heirarchy  
    function deposit() public payable {
        uint points = msg.value / 100; 
        uint total;
        uint amount=0;
        
        amount=points*60;
        total=total+amount;
        employee_one.transfer(amount);
        
        amount=points*25;
        total=total+amount;
        employee_two.transfer(amount);
        
        amount=points*15;
        total=total+amount;
        employee_three.transfer(amount);
        
        employee_one.transfer(msg.value-total);
    }

    function() external payable {
        deposit();
    }
}
