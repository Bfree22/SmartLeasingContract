# Project 3: Smart Contract for Real Estate Leases

# <p align="center"> The Contract of the Future </p>
  <p align="center"> Blockchain leases  . </p>

## Premise
Our team is developing a Smart Least Contract that we would pitch to 


## Screenshots/Gifs of Contract

![Program](Images/SmartLeaseFinalCode.gif)
Used [Screen to Gif](https://www.screentogif.com/) for the gifs.



## The Buttons And What They Do
![ContractPartOne](Images/ContractButtonsPartOne.png)
* Assign Resident: Button used to assing the Resident to the Smart Contract Lease
* Have No Pet/Have Pet: Depending on which button you use there's a slight change in price between having a pet and not having a pet.
* Pay Deposit: Used by Leasor to pay landlord the required deposit 
* Pay Nth Rent: Pays Rent/Moves Money from Leasee to the Renter. 
* Propose Written Agreement: Proposes the Smart Contract to the Rentee 
* Rent Time: Length of the Contract 
* Sign Agreement: Signs the Agreement 


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

## Results

### Additions That Could be Made if Project "Picked Up"

 


## Project Worked on By
* [William Brooks](https://github.com/Wil-bro0824)
* [Jimmy Brown](https://github.com/jbrown2155)
* [Brock Freeman](https://github.com/Bfree22)
* [Benjamin McCright](https://github.com/BenMcCright)
* [David Ready](https://github.com/CrusadingGroundhog)
* [Manolo Serrano](https://github.com/InfluxVC)

## Framework Used
* [Smart Lease Contract Used as Skeleton for our work](https://github.com/SmartLease/Ethereum/blob/master/contracts/smartleasefactory.sol)
