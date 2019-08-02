var CoShoe = artifacts.require("CoShoe");

module.exports = function (deployer) {
    // Deploy the CoShoe contract
    deployer.deploy(CoShoe, '0x94d6a590d792365E1c1400cEA108CcAc171571ec');
};