/**
 *  @type import('hardhat/config').HardhatUserConfig
 * */
console.log("dotenv config loading...");
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

console.log("Current working directory:", process.cwd());
console.log("GANACHE_PRIVATE_KEY:", process.env.GANACHE_PRIVATE_KEY);

console.log("TEST_VAR:", process.env.TEST_VAR);

module.exports = {
  solidity: "0.8.28",
  networks: {
    ganache: {
      url: "HTTP://127.0.0.1:8545",
      accounts: [process.env.GANACHE_PRIVATE_KEY],
    },
  },
};
