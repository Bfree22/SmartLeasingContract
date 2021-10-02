# Project 3: Smart Contract for Real Estate Leases

# <p align="center"> The Contract of the Future </p>
  <p align="center"> Blockchain leases  . </p>
  
  ## Premise

This contract was designed to perform the same functionalities as a paper written lease contract but through a smart contract on the Ethereum blockchain. This is a test contract ran through https://remix.ethereum.org/ Our team developed this Smart Lease Contract as a pitch to Landlords and Property Managers, to help them organize and automate their lease agreements between tenants. Our smart contract makes it simple to propose contracts, add tenants, and keep track of rent payments all within the matter of a few minutes. 



![contract_tear](Images/contract_tear.jpeg)


## Functionality

### Initialize
The functionality of this smart contract is for the Landlord to initialize the contract. After initializing, they would then propose a written contract and specifiy the capacity limit and rent amount.

### Assign Tenants
Once and only after the contract has been proposed, the landlord would then assign tenants by entering the contract address of the intended residents. 

### Fill Contract and Sign
Once assigned, the tenants would then recieve and fill out the requested information. (Have Pet, Have No Pet) After the contract has been filled, the tenant would then 'Sign' the contract and make the first deposit.

### Make Deposit and Pay Rent
After making the first deposit, only the tenant will be able to 'Pay Rent' if the amount to send is '1 Ether' or more depending on the amount of pets selected by the resident.

5.
Only the assigned resident can pay rent, once rent is paid, the timer for rent to be paid will begin counting down based on the amount of months chosen by the resident. For example, if the resident selected '5' at 'renttime', then the amount of months selected is 5. That means the resident will have to pay rent each month for 5 months and can check the time remaining on each month until rent is due.  




### Contract Part One

![ContractPartOne](Images/ContractButtonsPartOne.png)

* Assign Resident: Button used to assing the Resident to the Smart Contract Lease
* Have No Pet/Have Pet: Depending on which button you use there's a slight change in price between having a pet and not having a pet.
* Pay Deposit: Used by Leasor to pay landlord the required deposit 
* Pay Nth Rent: Pays Rent/Moves Money from Leasee to the Renter. 
* Propose Written Agreement: Proposes the Smart Contract to the Rentee 
* Rent Time: Length of the Contract 
* Sign Agreement: Signs the Agreement 


### Contract Part Two

![ContractPartTwo](Images/ContractButtonsPartTwo.png)
* Address to Resident:  Address to call for the Resident
* Get Balance: See how much is on the contract.
* Get LandLord Balance: See how much LandLord Balance there is
* Get Leasee Balancec: See how much Balance the Leasee has in the contract
* Get Time Left: See how much time you have left for your lease
* Household Capacity: See Household Capacity
* Lessor Address: The address of the lessor
* Resident Address: The address of the residenct
* Resident Occupancy: Resident Occupancy   
* Written Agreement: Button for the Written Agreement 




## Order of Operations
* ProposeWrittenContract (As Landlord)
* assignResident (As Landlord)
* havePet / haveNoPet (As Resident)
* signAgreement (As Resident)
* payDeposit (Must select 1 Ether as value)
* renttime (insert months 1 - 6)
* Pay rent accordingly based on the amount of months selected when starting the lease.
* payFirstRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* paySecondRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* payThirdRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* payFourthRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* payFifthRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* paySixthRent (Insert Landlord address + Select 1(2) Ether as value, according to havePet)
* Selecting the “gettimeleft” functions will get the remaining time left to pay rent depending on the amount of months selected.
* gettimeleft
* gettimeleft1strent
* gettimeleft2ndrent
* gettimeleft3rdrent
* gettimeleft4thrent
* gettimeleft5thrent




## Screenshots/Gifs of Contract

![Program](Images/SmartLeaseFinalCode.gif)
Used [Screen to Gif](https://www.screentogif.com/) for the gifs.



## Results

### Due to our limitations on time and resources, we weren't able to include every single component of a smart lease contract. We believe our contract is a quality smart lease contract that can perform the basic functionalities of a paper lease agreement but much faster and more efficiently. If we had more time on this we would have cleaned up the features for the tenant so the landlord could add more fees based on location, and unit size. Once we have the back end features updated, we will start working on the front end so landlords and tenants can have a seamless experience.

 


## Project Worked on By
* [William Brooks](https://github.com/Wil-bro0824)
* [Jimmy Brown](https://github.com/jbrown2155)
* [Brock Freeman](https://github.com/Bfree22)
* [Benjamin McCright](https://github.com/BenMcCright)
* [David Ready](https://github.com/CrusadingGroundhog)
* [Manolo Serrano](https://github.com/InfluxVC)

## Framework Used
* [Smart Lease Contract Used as Skeleton for our work](https://github.com/SmartLease/Ethereum/blob/master/contracts/smartleasefactory.sol)
