/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */
var HDWalletProvider = require("truffle-hdwallet-provider");

//Gerar Mneumonico para criação de Wallet
//https://iancoleman.io/bip39/#english
//Importar o Mneumonico no Metamask, obter o endereço
//Obter Ether em https://www.rinkeby.io/#faucet
//Depois destes passos está pronto para importar o contrato
var mnemonic = "witness genius fade filter auto utility pistol until material fruit protect news"

module.exports = {
  migrations_directory: "./migrations",
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // Match any network id
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic,"https://rinkeby.infura.io/v3/dff260c9c0a84ce099334fe9b196b6b5");
      },
      network_id: 2
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 500
    }
  }
};

