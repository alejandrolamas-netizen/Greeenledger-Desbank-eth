# Judge Verification Instructions

Dear ETHGlobal Judge,

GreenLedger EVM provides three verification paths.

## Option A — Quick Verification

1. Open the deployed RealEstateToken on Base Sepolia BaseScan.
2. Read `totalSupply()`.
3. Read `registeredSurfaceSqFt()`.
4. Verify `totalSupply / 1e18 == registeredSurfaceSqFt`.

Reference invariant: `50,000 × 1e18` tokens for `50,000 sq ft`.

## Option B — Full Verification

```bash
forge test -vvv
forge test --match-test test_EnforcesInvariant -vvv
```

Inspect deployment and attestation transactions on Base Sepolia and reproduce the decision hash with `script/VerifyPublicly.s.sol`.

## Option C — Interactive Verification

1. Connect to Base Sepolia.
2. Open the Verification section.
3. Observe contract reads.
4. Confirm Attestation Exists, Decision Hash Match, Token Supply Valid and Invariant Holds.

The frontend is an interface to the verification process; on-chain state is the source of truth.

> Deployment URLs and transaction hashes must be populated only from independently verified chain evidence.
