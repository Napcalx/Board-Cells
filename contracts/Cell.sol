// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Board {
    uint8 public x_axis = 7;
    uint8 public y_axis = 5;

    enum Color{
        White,
        Red,
        Black,
        Blue
    }

    // mapping to store the ids
    mapping (uint256 => mapping(uint256 => Color)) _boardId;

    function cellLocation (uint8 cx_axis, uint8 cy_axis) public {
        for (uint8 x = 0; x < cx_axis; x++) {
            for (uint8 y = 0; y < cy_axis; y ++) {
                if ((x + y) % 4 == 0) {
                    _boardId[x][y] = Color.White;
                } else if ((x + y) % 4 == 1) {
                    _boardId[x][y] = Color.Black;
                } else if ((x + y) % 4 == 2) {
                    _boardId[x][y] = Color.Red;
                } else if ((x + y) % 4 == 3) {
                    _boardId[x][y] = Color.Blue;
                } else {
                    revert("Invalid set of numbers");
                }
            }
        }
    }

    function getCellColor (uint8 _x, uint8 _y) external view returns (string memory) {
        require (_x <= x_axis && _y <= y_axis, "Invalid x or y axis");
        return getColor(uint8(_boardId[_x][_y]));
    }

    function getColor (uint8 id) internal pure returns (string memory) {
        if (id == 1) return "White";  
        if (id == 2) return "Black";
        if (id == 3) return "Blue";
        if (id == 4) return "Red";
        return "Green";
    }

    function getCoordinateColor (uint8 x1, uint8 x2, uint8 y1, uint8 y2) 
        external view returns (string memory, string memory){
            require((x1 <= x_axis && x2 <= x_axis) && (y1 <= y_axis && y2 <= y_axis), "Invalid Coordiantes");
            Color color1 = _boardId[x1][y1];
            Color color2 = _boardId[x2][y2];

            return (getColor(uint8(color1)), getColor(uint8(color2)));
    }
}
