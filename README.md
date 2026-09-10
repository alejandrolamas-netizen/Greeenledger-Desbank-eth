# GreenLedger / Desbank — Ethereum / Base

**EmergentSoft · ETH/EVM adaptation track**

This repository is the personal-account destination for the Ethereum/EVM adaptation of GreenLedger / Desbank. The XRPL original is intentionally kept separate and must remain untouched.

## Parallel architecture

- **XRPL Original** — frozen / untouched
- **Ethereum / EVM** — this repository; Base / Base Sepolia track for ETHGlobal / Spotlight
- **Open House** — separate lightweight adaptation; it is not merged into this repository

## GreenLedger EVM

Target settlement network: **Base** (Ethereum L2).

- Base Mainnet: chain ID `8453`
- Base Sepolia: chain ID `84532`
- Explorer: https://sepolia.basescan.org
- Core invariant: `1 token = 1 square foot`
- Asset identifier convention: `RE-{TYPE}-{CITY}-{SEQ}`

## Current repository status

The repository has been created as the personal destination and seeded with its initial commit. The current commit contains the EVM dashboard artifact and documentation layer.

**Important:** documentation/specification material describes the intended architecture and roadmap. It must not be interpreted as proof of a deployed or verified smart-contract system. Any contract address, transaction hash, RPC state, or BaseScan verification must be added only after independently verified execution.

## Demo asset

Reference demo asset from the project specification:

- `RE-COM-NYC-001`
- Manhattan Commercial Tower
- 50,000 sq ft
- Reference valuation: USD 48.5M

These values are demonstration/project-specification data, not a claim of a live production asset.

## Architecture reference

The planned EVM stack includes:

- Solidity contracts: factory, real-estate token, identity/compliance, oracle, AI attestation, escrow and treasury
- Go services and EVM settlement adapter
- QAIzero intelligence layer
- Sentinel compliance/policy layer
- AetherOS security/signing layer
- The Graph indexing
- React/TypeScript dashboard

See `docs/MASTER-SPEC.md` for the architecture and implementation roadmap.

## Repository integrity rule

Do **not** modify or merge this EVM track into the XRPL original. The two implementations are parallel tracks with separate settlement adapters.

## Owner

Alejandro Lamas — Founder & CEO, EmergentSoft
