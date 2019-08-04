const CoShoe = artifacts.require('./CoShoe.sol')

contract("CoShoe",(accounts) => {
    const shoeOwner = accounts[0]
    const randAddress = accounts[1]

    const exampleImageURL = ""

    //predefine parameters
    const validShoe = {
        name: "",
        image: exampleImageURL,
        sold: false,
        price: web3.utils.toWei('0.5', 'ether')
    }

    // Initialize shoes sold and price
    let noShoes = 0;
    let price = web3.utils.toWei('0.5', 'ether');
    
    context("Buy Shoe", function () {
        it('mints 100 tokens', async () => {
            //creates an instance to the contract
            let ShoeInstance = await CoShoe.deployed()
            let shoes = await ShoeInstance.getNumberofTokens()
            assert.equal(shoes,100, "not 100 tokens minted")
        })
        it('correctly transfers ownership', async () => {
            let ShoeInstance = await CoShoe.deployed()

            await ShoeInstance.buyShoe(validShoe.name,validShoe.image, {
                from: shoeOwner, value: validShoe.price
            })
            let shoe = await ShoeInstance.shoes(0)

            assert.equal(shoe['owner'],shoeOwner, 'Owner does not match')
            assert.equal(shoe['name'],validShoe.name,'name does not match')
            assert.equal(shoe['image'],validShoe.image,'image does not match')
            assert.equal(validShoe.price, price, "Not sufficient funds")
        })

        it('should return correct number of trues', async () => {
            let ShoeInstance = await CoShoe.deployed()

            let checkBuy = await ShoeInstance.checkPurchases()
            let trueCount = 0
            for (var i = 0; i< checkBuy.length; i++) {
                var iNew = checkBuy[i]
                if (iNew == true) {
                    trueCount = trueCount + 1
                }
            }
            
            assert.equal(trueCount, 1, 'Should be true')
            
        })
        

    })
    
})