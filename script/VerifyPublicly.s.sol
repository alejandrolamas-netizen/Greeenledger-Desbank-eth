// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/AIAttestationRegistry.sol";
import "../src/RealEstateToken.sol";

contract VerifyPubliclyScript is Script {
    function run() external view {
        AIAttestationRegistry attestation=AIAttestationRegistry(vm.envAddress("ATTESTATION_ADDRESS"));
        RealEstateToken token=RealEstateToken(vm.envAddress("DEMO_TOKEN_ADDRESS"));
        bytes32 expectedDecisionHash=vm.envBytes32("DEMO_DECISION_HASH");
        bytes32 assetId=keccak256("GL-BUE-001");
        (bool attested,bytes32 storedDecisionHash)=attestation.getAttestation(assetId);
        uint256 totalSupply=token.totalSupply();
        uint256 registeredSurface=token.registeredSurfaceSqFt();
        uint256 expectedSupply=registeredSurface*1e18;
        console.log("=== PUBLIC VERIFICATION ===");
        console.log("Attestation Exists:",attested);
        console.log("Decision Hash Match:",storedDecisionHash==expectedDecisionHash);
        console.log("Total Supply:",totalSupply);
        console.log("Registered Surface:",registeredSurface);
        console.log("Invariant Holds:",totalSupply==expectedSupply);
        if(attested && storedDecisionHash==expectedDecisionHash && totalSupply==expectedSupply) console.log("ALL VERIFICATION CHECKS PASSED");
        else console.log("VERIFICATION FAILED");
    }
}
