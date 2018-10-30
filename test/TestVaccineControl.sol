pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/VaccineControl.sol";

contract TestVaccineControl {

    function testAddingNewPerson() public {

        VaccineControl vaccineControl = VaccineControl(DeployedAddresses.VaccineControl());

        string memory firstName = "Michel";
        string memory lastName = "Fernandes";
        
        bool result;
       
        result = vaccineControl.addPerson(firstName, lastName);

        Assert.equal(result, true, "Adding new person.");
    }

    function testAddingNewVaccine() public {
        
        VaccineControl vaccineControl = VaccineControl(DeployedAddresses.VaccineControl());

        uint idVaccine = 1;
        uint dose = 1;
        string memory batch = "12-2018-ABC";
        string memory place = "Posto de Saúde Santa Maria";
        bool result;
       
        result = vaccineControl.addVaccine(idVaccine, dose, batch, place);

        Assert.equal(result, true, "Adding new vaccine.");
    }
}