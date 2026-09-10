# GreenLedger / Desbank — Ethereum / Base

**EmergentSoft · RWA Tokenization & Financial Infrastructure**

## What it is

This repository is the personal-account destination for the Ethereum/EVM adaptation of GreenLedger / Desbank. The XRPL original is intentionally kept separate and untouched.

## Business problem

Enterprise RWA workflows need auditable tokenization, AI decision attestations and reproducible verification across an EVM settlement environment.

## Product capabilities

- AI-attestation-gated asset tokenization
- ERC-20 RWA asset representation
- Surface-area / supply invariant enforcement
- Public verification tooling
- Base / Base Sepolia deployment workflow

## Architecture

`Real-World Asset → AIAttestationRegistry → GreenLedgerFactory → RealEstateToken → Verification`

## Network tracks

- **XRPL Original** — frozen / untouched
- **Ethereum / EVM** — this repository; Base / Base Sepolia track
- **Open House** — separate lightweight adaptation
- **Arbitrum** — separate network adaptation

## Evidence policy

Source code, tests and verification scripts establish the implementation and its reproducible verification procedure. They do **not** by themselves establish that a Base Sepolia deployment exists.

Only publish contract addresses, transaction hashes, block numbers and explorer links after those values have been independently produced and checked on-chain.

## Commercial role

GreenLedger / Desbank provides RWA tokenization and financial-rail infrastructure for enterprise financing, asset representation and governed digital-asset workflows.

## Security & IP

See [`SECURITY.md`](SECURITY.md) and [`LICENSE`](LICENSE). Third-party components remain subject to their respective licenses.

## Owner

Alejandro Lamas — Founder & CEO, EmergentSoft
