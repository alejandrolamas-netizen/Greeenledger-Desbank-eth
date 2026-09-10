# GreenLedger / Desbank — Ethereum / Base

**EmergentSoft · ETH/EVM adaptation track**

This repository is the personal-account destination for the Ethereum/EVM adaptation of GreenLedger / Desbank. The XRPL original is intentionally kept separate and untouched.

## Parallel architecture

- **XRPL Original** — frozen / untouched
- **Ethereum / EVM** — this repository; Base / Base Sepolia track for ETHGlobal / Spotlight
- **Open House** — separate lightweight adaptation; not merged into this repository
- **Arbitrum** — next network adaptation; developed separately from the Base implementation

## GreenLedger EVM

Target settlement network: **Base** (Ethereum L2).

- Base Mainnet: chain ID `8453`
- Base Sepolia: chain ID `84532`
- Explorer: https://sepolia.basescan.org
- Core invariant: `1 token = 1 square foot`
- Asset identifier convention: `RE-{TYPE}-{CITY}-{SEQ}`

## Included implementation

- `src/AIAttestationRegistry.sol` — authorized AI decision attestations
- `src/GreenLedgerFactory.sol` — asset-token factory
- `src/RealEstateToken.sol` — ERC-20 RWA token with enforced supply invariant
- `test/RealEstateToken.t.sol` — attestation gate and invariant tests
- `test/RealEstateTokenInvariant.t.sol` — 50,000 sq ft reference invariant
- `script/Deploy.s.sol` — Base Sepolia deployment flow
- `script/SeedDemoAsset.s.sol` — attestation + token deployment + tokenization flow
- `script/VerifyPublicly.s.sol` — independent public verification
- `src/abi/GreenLedgerABIs.ts` — frontend ABI definitions
- `src/components/PublicVerification.tsx` — live contract-read verification UI
- `docs/06-security.md` — public auditability model
- `docs/JUDGE-VERIFICATION.md` — ETHGlobal judge verification paths
- `foundry.toml` / `remappings.txt` / `Makefile` — reproducible Foundry setup

## Verification

```bash
forge install OpenZeppelin/openzeppelin-contracts --no-commit
forge install foundry-rs/forge-std --no-commit
forge test -vvv
forge test --match-test test_EnforcesInvariant_ExactSupplyMatchesSurfaceArea -vvv
```

For a deployed Base Sepolia environment, configure `.env` from `.env.example` and run:

```bash
make verify-publicly
```

## Evidence policy

Source code, tests and verification scripts establish the implementation and its reproducible verification procedure. They do **not** by themselves establish that a Base Sepolia deployment exists.

Only publish contract addresses, transaction hashes, block numbers and BaseScan links after those values have been independently produced and checked on-chain.

## Demo asset

Reference project asset:

- `RE-COM-NYC-001`
- Manhattan Commercial Tower
- 50,000 sq ft
- Reference valuation: USD 48.5M
- Risk grade: A

These values are reference/demo data unless accompanied by independent on-chain evidence.

## Repository integrity rule

Do not modify or merge this EVM track into the XRPL original. The implementations remain parallel network-specific tracks.

## Owner

Alejandro Lamas — Founder & CEO, EmergentSoft
