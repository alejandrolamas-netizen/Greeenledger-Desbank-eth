# Ethereum / Base Track — Security Parity Plan

**Status:** gap analysis from source inspection. No code changes or security sign-off are implied by this document.

## Baseline comparison

The Arbitrum track has advanced beyond the current Ethereum/Base contract implementation. The Ethereum/Base contracts must not inherit Arbitrum's security claims until equivalent controls are implemented, tested, reviewed and deployed independently.

| Control | Arbitrum source | Ethereum/Base source | Required action |
|---|---|---|---|
| Append-only attestation history | Present | Missing; mapping keyed by assetId is overwritten | Port history IDs and current pointer |
| Attestation expiry | Present | Missing | Add optional expiry and boundary tests |
| Revocation | Present | Missing | Add revocation authority, reason hash and lifecycle tests |
| Attestor authorization event | Present | Missing | Emit and test authorization changes |
| Input validation in registry | Present | Minimal | Reject zero IDs/hashes, empty metadata and invalid valuation |
| Two-step ownership transfer | Present | Ownable only | Evaluate and implement Ownable2Step |
| Emergency tokenization pause | Present | Missing | Add pause gate without implying transfer freeze |
| Factory registry validation | Present | Only equality check at deploy time | Validate nonzero deployed registry code |
| Asset-ID uniqueness | Present | Missing | Add one-token-per-asset mapping and tests |
| Token constructor validation | Present | Missing | Validate IDs, hashes, supply unit and registry code |
| Recipient validation | Present | Missing | Reject zero recipient |
| Fuzz/invariant coverage | Present in Arbitrum | Not demonstrated at equivalent depth | Port and adapt property tests |
| Indexer/dashboard | Arbitrum Sepolia prototype | Not present in this repository | Separate network-specific implementation and DB |

## Required implementation sequence

### EVM-SEC-01 — Registry lifecycle
- Port append-only attestation records and per-asset history.
- Add unique attestation IDs and current-record pointer.
- Add expiry and revocation.
- Emit authorization, attestation and revocation events.
- Preserve backward compatibility only if explicitly required; document migration behavior.

### EVM-SEC-02 — Governance and emergency controls
- Evaluate Ownable2Step and explicit owner handover.
- Add a pause for new tokenization.
- Define what pause does and does not affect.
- Document owner privileges and key recovery limitations.

### EVM-SEC-03 — Factory and token integrity
- Validate registry address and deployed bytecode.
- Enforce nonzero asset IDs and one token per asset ID per factory.
- Validate token metadata, hashes, surface and recipient.
- Confirm the supply formula and units with product/legal stakeholders.

### EVM-SEC-04 — Verification
- Port lifecycle, authorization, pause, uniqueness and invalid-input tests.
- Add fuzz and stateful invariant tests.
- Run static analysis and dependency checks.
- Keep deployment and verification scripts restricted to the intended testnet.
- Create a separate pull request for implementation; do not mix this plan with deployment.

## Important design questions

1. Is ERC-20 transferability unrestricted, or should transfers be permissioned for the intended asset/legal structure?
2. Is the token supply formula based on square feet, square metres, or another asset-specific unit?
3. What currency, scale, source and timestamp does valuation represent?
4. What is the policy for revoking a current attestation after tokenization?
5. Who controls registry ownership, and what recovery and separation-of-duty controls are required?

## Release rule

Do not describe Ethereum/Base as having Arbitrum's lifecycle, governance, pause, uniqueness or fuzz/invariant controls until code, tests and CI evidence exist on this repository. A successful CI run is not an audit or deployment.
