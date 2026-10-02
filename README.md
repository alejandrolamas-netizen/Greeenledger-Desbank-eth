# GreenLedger / Desbank — Ethereum / Base

**EmergentSoft · RWA Tokenization & Financial Infrastructure**

## Status

**EVM implementation / Base track.**

This repository contains the Ethereum-compatible implementation of the GreenLedger / Desbank tokenization architecture, with Base / Base Sepolia deployment tooling.

## Purpose

Enterprise RWA workflows need auditable tokenization, AI decision attestations and reproducible verification across an EVM settlement environment.

## Implemented scope

- AI-attestation-gated asset tokenization
- ERC-20 RWA asset representation
- Surface-area / supply invariant enforcement
- Deployment and verification tooling
- Automated tests

## Architecture

`Real-World Asset → AIAttestationRegistry → GreenLedgerFactory → RealEstateToken → Verification`

## Network tracks

- **XRPL Original** — separate / frozen workstream
- **Ethereum / EVM** — this repository; Base / Base Sepolia track
- **Arbitrum** — separate network adaptation

## Evidence policy

Source code, tests and deployment tooling establish implementation evidence. They do **not** by themselves establish that a live Base or Base Sepolia deployment exists.

Only publish contract addresses, transaction hashes, block numbers and explorer links after independently checking the corresponding chain.

The repository should also not be interpreted as evidence of a regulated financial service, securities offering, investment product or legal ownership interest.

## Attestation model

The current implementation associates an asset with an AI decision hash before tokenization. Before production financial use, the attestation model should be extended with explicit history/versioning, model provenance, attestor identity and governance controls as required by the deployment context.

## Commercial role

GreenLedger / Desbank provides technical infrastructure for RWA tokenization and governed digital-asset workflows.

## Security & IP

See `SECURITY.md` and `LICENSE`.

## Owner

Alejandro Lamas — Founder & CEO, EmergentSoft
