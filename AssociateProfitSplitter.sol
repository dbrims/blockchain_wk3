pragma solidity ^0.5.0;

// lvl 1: equal split

contract AssociateProfitSplitter {
    address payable public employee_one;
    address payable public employee_two;
    address payable public employee_three;

//defile the addresses the payment will split between 
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

//access the balance on the contract (should be zero)
    function balance() public view returns(uint) {
        return address(this).balance;
    }

//Accept payment and disperse it to the payees
    function deposit() public payable {
        uint amount=msg.value/3;
        uint remains= msg.value%3;

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
     
        msg.sender.transfer(remains);
    }

    function() external payable {
        deposit(); 
    }
}
