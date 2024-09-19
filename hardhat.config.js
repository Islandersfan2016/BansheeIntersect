require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
  	intersect: {
  		url: 'https://subnets.avax.network/pearl/testnet/rpc',
  		chainId: 1612, // Moonbase alpha testnet,
  		accounts: ['']
  	}
  }
};
