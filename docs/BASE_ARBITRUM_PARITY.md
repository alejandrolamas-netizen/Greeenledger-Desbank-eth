# Base Sepolia / Arbitrum parity matrix

**Snapshot:** 2026-11-14  
**Compared refs:** `main` in both repositories at the time of inspection.  
**Purpose:** document repository-level evidence only. This is not a deployment, runtime, legal, or security-audit attestation.

## Solidity source parity

The following files have identical Git blob SHAs in both repositories at the compared `main` refs:

| File | Blob SHA | Result |
|---|---|---|
| `src/AIAttestationRegistry.sol` | `3757a038abf51b6adb430521560097e1cf5629c3` | Identical |
| `src/GreenLedgerFactory.sol` | `b475c7c338a62a23b395097ff51b18e363170be9` | Identical |
| `src/RealEstateToken.sol` | `cadf2ed4dbc71f24db4f15ba9f8b1aeefb314be4` | Identical |

This supports source-level parity for these three files at the inspected refs only. It does not establish deployed bytecode parity, equivalent constructor arguments, equivalent ownership configuration, or equivalent chain behavior.

## Test parity

| File | Base Sepolia blob SHA | Arbitrum blob SHA | Assessment |
|---|---|---|---|
| `test/AttestationLifecycle.t.sol` | `0c04cead21dda80da82103afb3d60d35f3d2a74b` | `0c04cead21dda80da82103afb3d60d35f3d2a74b` | Identical |
| `test/GreenLedgerSecurityProperties.t.sol` | `92ef642de4c05664e529e1f610fd94c816755410` | `92ef642de4c05664e529e1f610fd94c816755410` | Identical |
| `test/RealEstateToken.t.sol` | `443bd36293f37f59e4ee2b8fd1812195cead783c` | `443bd36293f37f59e4ee2b8fd1812195cead783c` | Identical |
| `test/RealEstateTokenInvariant.t.sol` | `72e31c4d7810a0de76493e8208e8fabf9c4fb6ce` | `b9cce9e861c94e641095cf99ae3885028d2b7bff` | Different; review required |

The Base invariant-named test is a pair of deterministic property tests using a mock attestation registry. The Arbitrum file declares a Foundry `invariant_...` property against a deployed test registry/token instance. These are not equivalent test implementations and should not be represented as identical invariant coverage.

## Foundry configuration differences

| Setting | Base Sepolia | Arbitrum |
|---|---|---|
| Solidity compiler | 0.8.24 | 0.8.24 |
| Optimizer | enabled, 200 runs | enabled, 200 runs |
| Fuzz profile | 10,000 runs in `profile.ci`; default 256 | Not explicitly configured in the inspected file |
| RPC aliases | `base_sepolia` | `arbitrum`, `arbitrum_sepolia` |
| Explorer verification | BaseScan Sepolia, chain 84532 | Arbiscan, chains 42161 / 421614 |

The configuration differences are chain-specific where expected. The Base repository has an explicit CI fuzz profile not present in the inspected Arbitrum config.

## Workflow evidence available at this snapshot

- Base security scanning (Gitleaks and Slither): successful on PR #9 commit `35804efba7d16710659504bb27ec7284eedf62b5`.
- Base Foundry build, unit, fuzz and invariant workflow: successful on the same PR commit.
- Arbitrum PR #13 (pin indexer workflow actions) and PR #14 (Gitleaks and indexer dependency scanning) were open draft PRs at inspection time; their existence does not imply integration into `main`.

## Required follow-up before claiming full parity

1. Review and align the two `RealEstateTokenInvariant.t.sol` strategies; decide which properties should be tested as true Foundry invariants and apply equivalent coverage to both chains.
2. Align or explicitly document fuzz profiles and CI commands.
3. Compare constructor/deployment scripts, chain IDs, RPC/explorer configuration, and privileged-role initialization.
4. After any code changes, rerun tests on both repositories and record exact commit SHAs.
5. Separately verify deployed addresses and bytecode on each explorer before making any deployment-parity claim.

## Evidence boundary

This matrix compares Git-tracked source/configuration at the inspected refs. It does not prove that either repository is deployed, independently audited, legally validated, production-ready, or operating with real-world assets. Use synthetic testnet data until governance, security, legal, and operational reviews are complete.
