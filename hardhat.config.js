/** @type import('hardhat/config').HardhatUserConfig */

require("hardhat-deploy")

module.exports = {
  defaultNetwork:"hardhat",
  solidity: "0.8.9",
  namedAccounts :
  {
    deployer : 
    {
      default :0,
      1:0
    }
  }
};
