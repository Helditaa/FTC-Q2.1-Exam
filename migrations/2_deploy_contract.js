var FinTechExam = artifacts.require("FinTechExam");

module.exports = function (deployer) {
    // Deploy the FinTechExam contract
    deployer.deploy(FinTechExam, '0x94d6a590d792365E1c1400cEA108CcAc171571ec');
};