pragma solidity ^0.8.0;
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract SmartLeaseAgreement {
    event WrittenAgreementProposed(uint timestamp, string ipfsHash);
    event ResidentAssigned(uint timestamp, address residentAddress, uint rentAmount, uint depositAmount);
    event ResidentSigned(uint timestamp, address residentAddress);
    event PaidDeposit(uint timestamp, address residentAddress, uint amount);
    struct Resident {
        uint rentAmount;
        uint depositAmount;
        bool completeSigned;
        bool residentPaidDeposit;
        bool initialized;
        bool firstRentPaid;
        bool secondRentPaid;
        bool thirdRentPaid;
        bool fourthRentPaid;
        bool fifthRentPaid;
        bool sixthRentPaid;
        bool ownsPet;
    }
    
    mapping(address => Resident) public addressToResident;
       Resident[] internal residents;
       
    address public lessorAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public residentAddress;
    string public writtenAgreementIpfsHash;
    uint8 public residentOccupancy = 0;
    uint deposit;
    uint rent;
    uint rentAmount;
    uint8 public HOUSEHOLD_CAPACITY = 5;
    
    // inheritance would be an issue with external constructors
    constructor() {
        require(lessorAddress != address(0), "Owner address must not be zero!");
        lessorAddress = lessorAddress;
        HOUSEHOLD_CAPACITY = HOUSEHOLD_CAPACITY;
    }
    modifier onlyResident() {
        require(addressToResident[msg.sender].initialized == true, "Only a resident can request this functionality");
        _;
    }
    modifier onlyLessor() {
        require(msg.sender == lessorAddress, "Only the Owner can request this functionality");
        _;
    }
    modifier residentAssigned() {
        require(msg.sender == residentAddress, "Only the resident can perform this addition");
        _;
    }
    modifier AgreementProposed() {
        require(!(isSameString(writtenAgreementIpfsHash, "")), "The written agreement has not been proposed yet");
        _;
    }
    modifier completeSigned() {
        require(addressToResident[msg.sender].completeSigned == true, "Resident must sign the agreement before requesting this functionality");
        _;
    }
    modifier residentPaidDeposit() {
        require(addressToResident[msg.sender].residentPaidDeposit == true, "Resident must pay deposit before paying first rent.");
        _;
    }
    modifier firstRentPaid() {
        require(addressToResident[msg.sender].firstRentPaid == true, "Resident must make deposit before paying first rent.");
        _;
    }
    modifier secondRentPaid() {
        require(addressToResident[msg.sender].secondRentPaid == true, "Resident must make first rent before paying second rent.");
        _;
    }
        modifier thirdRentPaid() {
        require(addressToResident[msg.sender].thirdRentPaid == true, "Resident must make second rent before paying third rent.");
        _;
    }
        modifier fourthRentPaid() {
        require(addressToResident[msg.sender].fourthRentPaid == true, "Resident must make third rent before paying fourth rent.");
        _;
    }
        modifier fifthRentPaid() {
        require(addressToResident[msg.sender].fifthRentPaid == true, "Resident must make fourth rent before paying fifth rent.");
        _;
    }
        modifier sixthRentPaid() {
        require(addressToResident[msg.sender].sixthRentPaid == true, "Resident must make fifth rent before paying sixth rent.");
        _;
    }
     modifier notZeroAddres(address addr){
        require(addr != address(0), "0th address is not allowed!");
        _;
    }
    function proposeWrittenAgreement(string calldata _writtenAgreementIpfsHash) external onlyLessor {
        // Update written contract ipfs hash
        writtenAgreementIpfsHash = _writtenAgreementIpfsHash;
        emit WrittenAgreementProposed(block.timestamp, _writtenAgreementIpfsHash);
    }
    
    
    function assignResident(address payable _residentAddress)
        external onlyLessor AgreementProposed notZeroAddres(_residentAddress){
        // require room in the house
        
        uint _rentAmount = 1 ether;
        rent = _rentAmount;
        uint _depositAmount = 1 ether;
        lessorAddress = lessorAddress;
        
        
        require(residentOccupancy < HOUSEHOLD_CAPACITY, "The unit is fully occupied.");
        require(_residentAddress != lessorAddress, "Lessor is not allowed to be a tenant at the same time.");
        require(addressToResident[_residentAddress].initialized == false, "Duplicate residents assigned are not allowed.");
        residents.push(Resident(_rentAmount, _depositAmount, false, false, true, false, false, false, false, false, false, false));
        addressToResident[_residentAddress] = residents[residentOccupancy];
        residentAddress == _residentAddress;
        residentOccupancy++;
        emit ResidentAssigned(block.timestamp, _residentAddress, _rentAmount, _depositAmount);
    }
    
    
    
    
    
    function havePet(address _residentAddress)
        external onlyResident{
            addressToResident[_residentAddress].ownsPet = true;
        }
        
    function haveNotPet(address _residentAddress)
        external onlyResident{
            addressToResident[_residentAddress].ownsPet = false;
        }
        
        
        
        
        
    function signAgreement() external onlyResident AgreementProposed {
        require(addressToResident[msg.sender].completeSigned == false, "The resident has already signed the agreement");
        // Tenant signed
        addressToResident[msg.sender].completeSigned = true;
        emit ResidentSigned(block.timestamp, msg.sender);
    }
    function payDeposit(address payable lessorAddress) external payable onlyResident completeSigned {
        require(msg.value == addressToResident[msg.sender].depositAmount,
            "Amount of provided deposit does not match the amount of required deposit");
        require(addressToResident[msg.sender].residentPaidDeposit == false, "The resident has already paid the deposit");
        deposit += msg.value;
        uint amount = msg.value;
        lessorAddress.transfer(amount);
        addressToResident[msg.sender].residentPaidDeposit = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    
    
    
    function payFirstRent(address payable lessorAddress) external payable onlyResident residentPaidDeposit {
        // require(msg.value == addressToResident[msg.sender].rentAmount,"Amount of provided rent paid does not match the amount of required rent");
        require(addressToResident[msg.sender].firstRentPaid == false);
        
    
        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
        
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
        require(msg.value == addressToResident[msg.sender].rentAmount);
            rent = rent;
        }
        
        
        addressToResident[msg.sender].firstRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    
    
    
    function paySecondRent(address payable lessorAddress) external payable onlyResident firstRentPaid {
        // require(msg.value == addressToResident[msg.sender].rentAmount,"Amount of provided rent paid does not match the amount of required rent");


        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
        require(msg.value == addressToResident[msg.sender].rentAmount);
            rent = rent;
        }
        
        
        addressToResident[msg.sender].secondRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    
    
    function payThirdRent(address payable lessorAddress) external payable onlyResident secondRentPaid {
        
        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
        require(msg.value == addressToResident[msg.sender].rentAmount);    
            rent = rent;
        }
        
        
        addressToResident[msg.sender].thirdRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    function payFourthRent(address payable lessorAddress) external payable onlyResident thirdRentPaid {
        
        
        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
        require(msg.value == addressToResident[msg.sender].rentAmount);
            rent = rent;
        }
        
        
        addressToResident[msg.sender].fourthRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    function payFifthRent(address payable lessorAddress) external payable onlyResident fourthRentPaid {
        
        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
            require(msg.value == addressToResident[msg.sender].rentAmount);
            rent = rent;
        }
        
        addressToResident[msg.sender].fifthRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    function paySixthRent(address payable lessorAddress) external payable onlyResident fifthRentPaid {

        if (addressToResident[msg.sender].ownsPet == true) {
        require(msg.value == addressToResident[msg.sender].rentAmount + 1 ether,"Amount of provided rent paid does not match the amount of required rent");
        uint amount = msg.value;
        lessorAddress.transfer(amount);
            rent = rent;
        }
        else if (addressToResident[msg.sender].ownsPet == false){
            require(msg.value == addressToResident[msg.sender].rentAmount);
            rent = rent;
        }
        
    

        addressToResident[msg.sender].sixthRentPaid = true;
        emit PaidDeposit(block.timestamp, msg.sender, msg.value);
    }
    
    function getbalance() public view returns(uint) {return address(this).balance;}
    
    function getLandlordBalance() onlyLessor public view returns(uint) {
        return address(lessorAddress).balance;
    }
    function getLessorBalance() onlyResident public view returns(uint) {
        return address(residentAddress).balance;
    }
    
   uint[] internal rent_period = [0, 2592000, 2592000*2, 2592000*3,  2592000*4,  2592000*5, 2592000*6];
   uint timeleft;
   function end() internal view {
    SafeMath.add(timeleft, block.timestamp);
   }
   uint _time;
   function renttime(uint time) public payable {
       _time = time;
       timeleft = SafeMath.add(rent_period[time],block.timestamp);
   }
  function gettimeleft() public view returns(uint) {
      return SafeMath.sub(timeleft, block.timestamp);
  }
  function gettimeleft1stMonth() public view returns(uint) {
      return SafeMath.sub(gettimeleft(), rent_period[5]);
  }
    function gettimeleft2ndMonth() public view returns(uint) {
      return SafeMath.sub(gettimeleft(), rent_period[4]);
  }
 
 
 
 
      function gettimeleft3rdMonth() public view returns(uint) {
      return SafeMath.sub(gettimeleft(), rent_period[3]);
  }
      function gettimeleft4thMonth() public view returns(uint) {
      return SafeMath.sub(gettimeleft(), rent_period[2]);
  }
    function gettimeleft5thMonth() public view returns(uint) {
      return SafeMath.sub(gettimeleft(), rent_period[1]);
  }
    function isSameString(string memory string1, string memory string2) private pure returns (bool) {
        return keccak256(abi.encodePacked(string1)) == keccak256(abi.encodePacked(string2));
    }
}