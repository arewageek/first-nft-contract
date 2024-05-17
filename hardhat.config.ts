import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.19",
};

export default config;

// require("@nomicfoundation/hardhat-toolbox");
// require("dotenv").config();

// module.exports = {
//   solidity: "0.8.20",
//   defaultNetwork: "sepolia",
//   networks: {
//     sepolia: {
//       url: `${process.env.IPFS_URI}`,
//       accounts: [process.env.PRIVATE_KEY],
//     },
//   },
// };
