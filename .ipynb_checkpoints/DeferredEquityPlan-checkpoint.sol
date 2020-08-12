pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    address human_resources;
    address payable employee; 
    bool active = true;
 
 //define total number of shares being granted and number vesting annually
    uint total_shares=1000;
    uint annual_distribution=250;
    uint public distributed_shares; 
    
//Define the hire date and aniversary date    
    uint start_time = now; 
    uint unlock_time=now + 365 days;

//Define the employee and HR addresses
    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

//after confirming the person accessing the contract has standing, the shares are vested and the aniversary date is updated to the person's next aniversaary. 
    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        require(unlock_time<=now, "The shares are not ready to distribute");
        require(distributed_shares<total_shares,"All shares have already been distributed");
        
        unlock_time+=365 days;
        
        uint work_years=(now-start_time)/(365 days);
        distributed_shares=annual_distribution*work_years;

        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }


    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }
    
//     function fastforward() public {
//    fakenow += 100 days;
//    }


    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
