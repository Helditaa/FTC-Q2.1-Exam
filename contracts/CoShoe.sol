pragma solidity^0.5.0;

contract CoShoe {

    struct Shoe {
        address payable owner; //address of the owner
        string name; //name of owner
        string image; //url of the image
        bool sold;
    }

    uint256 price = 5*10**17;
    uint256 shoesSold = 0;
    uint256 count = 0;

    Shoe[] public shoes;

    constructor() public {
        for (uint i = 1; i <= 100; i++) {
        shoes.push(Shoe(msg.sender, "","",false));
        }
    }

    function getNumberofTokens() public view returns(uint count) {
        return shoes.length;
    }

    function buyShoe(string memory _name, string memory _image) public payable { //used to be external payable
        //require(shoes.length >0, "Shoes array is full");
        //require(Shoe.sold == true)
        require(msg.value == price, "Value is not equal to price");

        for (uint256 i = 0; i < shoes.length; i++) {
        if(shoes[i].sold == false)
            {
                shoes[i].owner = msg.sender;
                shoes[i].name = _name;
                shoes[i].image = _image;
                shoes[i].sold = true;
                shoes.push(Shoe(shoes[i].owner, shoes[i].name,shoes[i].image,shoes[i].sold));
                shoesSold++;
                
            } 
        }

    }

    function checkPurchases() external view returns (bool[] memory){
        bool[] memory checkPurchase;
        for (uint256 i = 0; i < shoes.length; i++){
            if (shoes[i].owner == msg.sender){
                checkPurchase[i] = true;
            }
        }
        return checkPurchase;
    }

}