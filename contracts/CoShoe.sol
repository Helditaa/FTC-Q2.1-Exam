pragma solidity^0.5.0;

contract CoShoe {

    struct Shoe {
        address payable owner; //address of the owner
        string name; //name of owner
        string image; //url of the image
        bool sold;
    }

    uint256 price = 0.5 * 10 ** 9;
    uint256 shoesSold = 0;

    Shoe[] public shoes;

    constructor() public {
        shoes.push(Shoe(msg.sender, "","",false));
        // mint 100 tokens
    }

    function buyShoe(string memory _name, string memory _image) public payable { //used to be external payable
        require(shoes.length > 0, "shoes array is empty");
        require(msg.value == price, "value is not equal to value");

        shoes.push(Shoe(msg.sender, _name, _image, true));
        shoesSold++;
    }

    function checkPurchases() external view returns (bool[] memory){
        bool[] memory checkPurchase;
        for (uint i = 0; i < shoes.length; i++){
            if (shoes[i].owner == msg.sender){
                checkPurchase[i] = true;
            }
        }
        return checkPurchase;
    } 
}