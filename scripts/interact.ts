import { ethers } from "hardhat";

async function main() {
  const Board = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0";

  const Boards = await ethers.getContractAt("Board", Board);

  console.log("=============getting cell color=============");
  const getColor = await Boards.getCellColor(4, 3);
  console.log(getColor);

  console.log("==========getting cell color pairs==========");
  const colorSet = await Boards.getCoordinateColor(3, 5, 5, 7);
  console.log(colorSet);
  console.log("============================================");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});