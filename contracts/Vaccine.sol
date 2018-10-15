pragma solidity ^0.4.23;

contract VaccinePerson {
    
    event statusEvent(uint indexed statusCode);
    
    struct Person {
        address personAddress;
        string firstName;
        string lastName;
        bool created;
        uint[] vaccineIds;
        mapping(uint => Vaccine) vaccines;
    }

    struct Vaccine {
        uint dose;
        string batch;
        string place;
        address personAddress;
    }

    mapping (address => Person) private persons;
    address[] private personAccounts;
    
    
    function addPerson(string _firstName, string _lastName) public returns (bool) {
        
        address _address = msg.sender;
        
        Person storage person = persons[_address];
        person.firstName = _firstName;
        person.lastName = _lastName;
        person.created = true;
        personAccounts.push(_address);

        emit statusEvent(100);
        
        return true;
    }
    
    function getPerson() public view returns (string, string) {
        address _address = msg.sender;
        return (persons[_address].firstName, persons[_address].lastName);
    }
    
    function getVaccine(uint _vaccineId) public view returns (uint, string, string) {
        address _address = msg.sender;
        return (persons[_address].vaccines[_vaccineId].dose, 
        persons[_address].vaccines[_vaccineId].batch, persons[_address].vaccines[_vaccineId].place);
    }
    
    function addVaccine(uint _vaccineId, uint _dose, string _batch, string _place) public 
            returns(bool) 
    {
        
        address _address = msg.sender;

        require(
            _dose > 0,
            "Dose is invalid."
        );
        
        require(
            bytes(_batch).length > 0,
            "Batch is invalid."
        );
        
        require(
            bytes(_place).length > 0,
            "Place of vaccine is invalid."
        );
        
        if (persons[_address].created) {
            
            Vaccine storage vaccine = persons[_address].vaccines[_vaccineId];
            vaccine.dose = _dose;
            vaccine.batch = _batch;
            vaccine.place = _place;
            vaccine.personAddress = _address;
            
            persons[_address].vaccines[_vaccineId] = vaccine;
   
            emit statusEvent(101);
        } 
        else
        {
            emit statusEvent(400);
        }
        
        return true;
    }
       
}