// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/AIAttestationRegistry.sol";
import "../src/RealEstateToken.sol";

contract VerifyPubliclyScript is Script {
    error UnsupportedChain(uint256 actualChainId);
    error VerificationFailed();

    uint256 constant BASE_SEPOLIA_CHAIN_ID = 84532;
    bytes32 constant EXPECTED_ASSET_ID = keccak256("GL-BASE-SEPOLIA-SYNTHETIC-001");

    function run() external view {
        if (block.chainid != BASE_SEPOLIA_CHAIN_ID) revert UnsupportedChain(block.chainid);

        AIAttestationRegistry attestation = AIAttestationRegistry(vm.envAddress("ATTESTATION_ADDRESS"));
        RealEstateToken token = RealEstateToken(vm.envAddress("DEMO_TOKEN_ADDRESS"));
        bytes32 expectedDecisionHash = vm.envBytes32("DEMO_DECISION_HASH");

        (bool attested, bytes32 storedDecisionHash) = attestation.getAttestation(EXPECTED_ASSET_ID);
        bool decisionHashMatch = storedDecisionHash == expectedDecisionHash;
        bool tokenConfigMatch = token.assetId() == EXPECTED_ASSET_ID
            && address(token.attestationRegistry()) == address(attestation);
        bool supplyInvariant = token.totalSupply() == token.registeredSurfaceSqFt() * (10 ** token.decimals());
        bool tokenized = token.isTokenized();

        console.log("=== BASE SEPOLIA PUBLIC VERIFICATION ===");
        console.log("Chain ID:", block.chainid);
        console.log("Attestation Valid:", attested);
        console.log("Decision Hash Match:", decisionHashMatch);
        console.log("Token Configuration Match:", tokenConfigMatch);
        console.log("Tokenized:", tokenized);
        console.log("Supply Invariant:", supplyInvariant);

        if (!(attested && decisionHashMatch && tokenConfigMatch && tokenized && supplyInvariant)) {
            revert VerificationFailed();
        }
        console.log("ALL VERIFICATION CHECKS PASSED");
        console.log("Synthetic test asset only; no real property or legal title is represented.");
    }
}
