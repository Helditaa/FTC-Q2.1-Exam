pragma solidity^0.5.0;

contract CoShoe {

    struct Shoe {
        address owner; //address of the owner
        string name; //name of owner
        string image; //url of the image
        bool sold;
    }

    uint256 price = 0.5 * 10 ** 9;
    uint256 shoesSold = 0;

    Shoe[] public shoes;

}