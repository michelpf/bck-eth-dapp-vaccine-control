var VaccinePerson = artifacts.require("./VaccinePerson.sol");

module.exports = function(deployer) {
  deployer.deploy(VaccinePerson);
};