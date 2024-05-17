const { ethers } = require("hardhat");

async function main() {
  // parameters for the contraact constructor
  const initialOwner = "Mystical";
  const tokenName = "Mystical";
  const ticker = "MST";

  // contract factory
  const contract = await ethers.getContractFactory(tokenName);

  // Deploy the contract
  const deployedContract = await contract.deploy(
    initialOwner,
    tokenName,
    ticker
  );
  await deployedContract.deployed();

  console.log("Contract deployed to:", deployedContract.address);

  // Optional: Set base URI if needed
  // if (baseUri) {
  //   const setBaseURITx = await deployedContract.setBaseURI(baseUri);
  //   await setBaseURITx.wait();
  //   console.log("Base URI set successfully!");
  // }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
