// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/AIAttestationRegistry.sol";
import "../src/GreenLedgerFactory.sol";
import "../src/RealEstateToken.sol";

contract SeedDemoAssetScript is Script {
    error UnsupportedChain(uint256 actualChainId);

    uint256 constant BASE_SEPOLIA_CHAIN_ID = 84532;
    bytes32 constant ASSET_ID = keccak256("GL-BASE-SEPOLIA-SYNTHETIC-001");
    bytes32 constant TITLE_HASH = keccak256("SYNTHETIC DEMO — NOT A PROPERTY TITLE");
    string constant MODEL_VERSION = "SYNTHETIC-DEMO-NOT-A-VALUATION-MODEL";
    string constant RISK_GRADE = "TEST-ONLY";
    uint256 constant TEST_VALUE_UNITS = 1;
    uint256 constant SURFACE_TEST_UNITS = 100;

    function run() external {
        if (block.chainid != BASE_SEPOLIA_CHAIN_ID) revert UnsupportedChain(block.chainid);

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        address attestationAddress = vm.envAddress("ATTESTATION_ADDRESS");
        address factoryAddress = vm.envAddress("FACTORY_ADDRESS");
        AIAttestationRegistry attestation = AIAttestationRegistry(attestationAddress);
        GreenLedgerFactory factory = GreenLedgerFactory(factoryAddress);

        vm.startBroadcast(deployerPrivateKey);
        bytes32 decisionHash = keccak256(
            abi.encode(ASSET_ID, MODEL_VERSION, RISK_GRADE, TEST_VALUE_UNITS, block.timestamp)
        );
        bytes32 attestationId = attestation.attest(
            ASSET_ID, decisionHash, MODEL_VERSION, RISK_GRADE, TEST_VALUE_UNITS
        );
        address tokenAddress = factory.deployAssetToken(
            "GreenLedger Synthetic Demo",
            "GL-DEMO",
            ASSET_ID,
            TITLE_HASH,
            decisionHash,
            SURFACE_TEST_UNITS,
            attestationAddress
        );
        RealEstateToken token = RealEstateToken(tokenAddress);
        token.executeTokenization(deployer);
        vm.stopBroadcast();

        console.log("NOTICE: synthetic test asset only; no real property or legal title.");
        console.log("Attestation ID:", vm.toString(attestationId));
        console.log("Token Contract:", tokenAddress);
        console.log("Total Supply:", token.totalSupply());
        console.log("Surface Test Units:", token.registeredSurfaceSqFt());
        console.log("Invariant Verified:", token.totalSupply() == SURFACE_TEST_UNITS * 1e18);
        console.log("DEMO_ASSET_ID=GL-BASE-SEPOLIA-SYNTHETIC-001");
        console.log("DEMO_DECISION_HASH=", vm.toString(decisionHash));
        console.log("DEMO_TOKEN_ADDRESS=", tokenAddress);
        console.log("DEMO_BLOCK_NUMBER=", block.number);
    }
}
