async function main() {
  try {
    const MyContract = await ethers.getContractFactory("EHR");
    const myContract = await MyContract.deploy();

    await myContract.waitForDeployment(); // Corrected line

    console.log("Contract deployed to:", await myContract.getAddress()); // Corrected line
    console.log("ABI: ", MyContract.interface);
  } catch (error) {
    console.error("Deployment error:", error);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });