// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/RealEstateToken.sol";

contract MockAttestationRegistryForTest is IAIAttestation {
    mapping(bytes32 => mapping(bytes32 => bool)) public attestations;
    address public authorizedAttester;
    constructor(address a){authorizedAttester=a;}
    function record(bytes32 assetId,bytes32 decisionHash) external {attestations[assetId][decisionHash]=true;}
    function isAttested(bytes32 assetId,bytes32 decisionHash) external view returns(bool,address){return(attestations[assetId][decisionHash],authorizedAttester);}
}

contract RealEstateTokenInvariantTest is Test {
    RealEstateToken token;
    MockAttestationRegistryForTest registry;
    bytes32 constant ASSET_ID=keccak256("GL-BUE-001");
    bytes32 constant TITLE_HASH=keccak256("Manhattan Commercial Tower Title Deed");
    bytes32 constant DECISION_HASH=keccak256("QAIzero-RWA-v1.0|A|48500000");
    uint256 constant SURFACE=50_000;
    address owner=address(0x1);
    address attester=address(0x2);

    function setUp() public {
        registry=new MockAttestationRegistryForTest(attester);
        vm.prank(owner);
        token=new RealEstateToken("GreenLedger Buenos Aires","GL-SF",ASSET_ID,TITLE_HASH,DECISION_HASH,SURFACE,address(registry));
    }

    function test_RevertWhen_MintingWithoutAttestation() public {
        vm.prank(owner);
        vm.expectRevert(RealEstateToken.AttestationNotFound.selector);
        token.executeTokenization(owner);
    }

    function test_EnforcesInvariant_ExactSupplyMatchesSurfaceArea() public {
        registry.record(ASSET_ID,DECISION_HASH);
        vm.prank(owner);
        token.executeTokenization(owner);
        assertEq(token.totalSupply(),SURFACE*1e18);
        assertEq(token.totalSupply()/1e18,token.registeredSurfaceSqFt());
        assertTrue(token.isTokenized());
    }
}
