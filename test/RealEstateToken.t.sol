// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/RealEstateToken.sol";

contract MockAttestationRegistry is IAIAttestation {
    mapping(bytes32 => mapping(bytes32 => bool)) public attestations;
    address public authorizedAttester;
    constructor(address _attester) { authorizedAttester = _attester; }
    function record(bytes32 aId, bytes32 dHash) external { attestations[aId][dHash] = true; }
    function isAttested(bytes32 aId, bytes32 dHash) external view returns (bool, address) { return (attestations[aId][dHash], authorizedAttester); }
}

contract RealEstateTokenTest is Test {
    RealEstateToken public token;
    MockAttestationRegistry public registry;
    bytes32 constant ASSET_ID = keccak256("GL-BUE-001");
    bytes32 constant TITLE_HASH = keccak256("Manhattan Commercial Tower Title Deed");
    bytes32 constant DECISION_HASH = keccak256("QAIzero-RWA-v1.0|A|48500000");
    uint256 constant SURFACE_SQFT = 10_000;
    address owner = address(0x1);
    address attester = address(0x2);

    function setUp() public {
        registry = new MockAttestationRegistry(attester);
        vm.prank(owner);
        token = new RealEstateToken("GreenLedger Buenos Aires", "GL-SF", ASSET_ID, TITLE_HASH, DECISION_HASH, SURFACE_SQFT, address(registry));
    }

    function test_RevertWhen_MintingWithoutAttestation() public {
        vm.prank(owner);
        vm.expectRevert(RealEstateToken.AttestationNotFound.selector);
        token.executeTokenization(owner);
    }

    function test_EnforcesInvariant_ExactSupplyMatchesSurfaceArea() public {
        registry.record(ASSET_ID, DECISION_HASH);
        vm.prank(owner);
        token.executeTokenization(owner);
        assertEq(token.totalSupply(), SURFACE_SQFT * 10**18);
        assertEq(token.totalSupply() / 10**18, token.registeredSurfaceSqFt());
        assertTrue(token.isTokenized());
    }
}
