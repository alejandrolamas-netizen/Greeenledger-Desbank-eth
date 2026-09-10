# Public Auditability

GreenLedger EVM is designed so critical claims can be independently verified without relying on the frontend, demo video, or team assertions.

## Public Auditability Flow

1. **BaseScan** — inspect AttestationRegistry, AssetAttested events and decisionHash.
2. **Decision Hash Reproduction** — recreate the exact canonical payload encoding used by the contract and hash with keccak256.
3. **Factory Deployment Trace** — inspect GreenLedgerFactory and AssetTokenCreated, then verify the emitted token address.
4. **Token Contract Verification** — read totalSupply() and registeredSurfaceSqFt() and verify `totalSupply == registeredSurfaceSqFt * 1e18`.
5. **Foundry Invariant Tests** — run `forge test --match-test test_EnforcesInvariant -vvv`.
6. **Attestation Logic Audit** — inspect assetId, decisionHash, modelVersion, riskGrade, valuation, timestamp and attestor authorization.

## Supply Invariant

For the reference asset: `registeredSurfaceSqFt = 50,000` and `totalSupply = 50,000 × 10^18`.

```solidity
totalSupply == registeredSurfaceSqFt * 1e18
```

## Evidence Policy

Architecture documents and procedures do not establish deployment by themselves. Contract addresses, transaction hashes, block numbers and BaseScan records must only be published when independently verified. Placeholder values such as `0x...` are never deployment evidence.
