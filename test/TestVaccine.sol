pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Vaccine.sol";

contract TestVaccine {

    function testAddingNewPerson() public {

        VaccinePerson vaccine = VaccinePerson(DeployedAddresses.VaccinePerson());

        string memory firstName = "Michel";
        string memory lastName = "Fernandes";
        bool result;
       
        result = vaccine.addPerson(firstName, lastName);

        Assert.equal(result, true, "Adding new person.");
    }

    function testAddingNewVaccine() public {
        
        VaccinePerson vaccine = VaccinePerson(DeployedAddresses.VaccinePerson());

        uint idVaccine = 1;
        uint dose = 1;
        string memory batch = "12-2018-ABC";
        string memory place = "Posto de Saúde Santa Maria";
        bool result;
       
        result = vaccine.addVaccine(idVaccine, dose, batch, place);

        Assert.equal(result, true, "Adding new vaccine.");
    }
}