# blockchain_wk3
intro to smart contracts

I have deployed the following contracts to the Kovan test network.  We are using this network, since it allows up to have the contract live on the network, where others can access it rather then on our local machine.  
The use case we were asked to explore for these three contracts was payroll management.

Level 1:
Contract address: 0x94ee338852c0008f61d06bf77aa247f59d8f5422
In this initial application, the contract allows HR (or any payer) to fund the contract, and those funds will then be evenly split between the group that formed the contract.  at the time of deployment, the wallet addresses for 3 payees was provided and it locked in for the entiretly of the contracts existance.  The payer is then able to deposit funds to the contract.  Under the hood, that deposit will be devided evenly into 3, and transfered to the payees, with any remainer going back to the payer.  Try it, send the payees Eth


Level 2:
Contract address: 0xbf4f4e98851a97e15ed0e6487d642954cf68ac31
In this second application, the contract allows HR (or any payer) to fund the contract, and those funds will then be split between the group the formed the contract in a preordained ratio (in our case 60:25:15).  At the time of deployment, the wallet addresses for 3 payees was provided and it locked in for the entiretly of the contracts existance.  The payer is then able to deposit funds to the contract.  Under the hood, the funds are devided acounding preordained ratio and transfered to payee.  Rather then any remainder being sent back to the payer, in this application, the remainder goes to the payee who recieved the lion's shar.  Try it, send me Eth


Level 3:
Contract address: 0xb06840348623a66e25f3e8f44e69f9cfa6548fb1
This application was the most different and more akin to tokens then transfer of coin.  In the hypothetical, a new employee was given a set number of shares when hired, with a quarter of the shares vesting each year.  In this contract, at time of deployment, the wallet address for the employee and the address for the HR was locked in, along with date of the hire.  Only after a year, does the contract allow either HR or the employee in to diperse their vested shares.  The emplyee or HR is then locked out for another year.  Only HR or the employees addresses are recongnized by the contract and allowed to interact with the functions (so you are out of luck).  the Employee or HR can also terminate the contract at any time.  You can look at the contract, but since you are not party to it, it will throw nothing but errors.  


