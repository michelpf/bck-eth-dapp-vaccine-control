var VaccineControl = artifacts.require("./VaccineControl.sol");

module.exports = function(deployer) {
  deployer.deploy(VaccineControl);
};