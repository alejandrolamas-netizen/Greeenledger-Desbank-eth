# GreenLedger / Desbank — Ethereum / Base

**EmergentSoft · RWA Tokenization & Financial Infrastructure**

## Status

**EVM implementation track — pre-commercial engineering baseline.**

This repository contains an Ethereum-compatible implementation and Base / Base Sepolia deployment tooling. Source code and scripts do not establish a live deployment, customer use, independent security audit or production readiness.

## Implemented baseline

- AI-attestation-gated ERC-20 asset tokenization
- surface-area / supply invariant logic
- deployment and verification scripts
- automated Solidity tests

## Important security status

The current Ethereum/Base contracts do **not** yet have the full lifecycle and governance controls present in the Arbitrum track. In particular, the registry currently overwrites the attestation keyed by asset ID and does not yet implement append-only history, expiry, revocation or an emergency tokenization pause. The factory does not yet enforce one token per asset ID. See [security parity plan](docs/12-security-parity-plan.md).

Do not claim cross-network security parity until the controls are implemented, tested and reviewed independently in this repository.

## Architecture

Real-world asset evidence → attestation registry → factory → ERC-20 representation → independent verification.

A token or metadata hash is not, by itself, proof of legal title, valuation, beneficial ownership or a right to cash flows.

## Network separation

- **XRPL:** separate historical workstream.
- **Ethereum / Base:** this repository.
- **Arbitrum:** separate implementation at [GreenLedger-Desbank-Arbitrum](https://github.com/alejandrolamas-netizen/GreenLedger-Desbank-Arbitrum).

## Commercial scope

The intended initial offer is enterprise software and implementation services for controlled RWA workflow pilots. No active liquidity, lending, yield, custody, exchange, redemption, bank integration or regulated financial service is claimed.

See [commercial readiness](docs/13-commercial-readiness.md).

## Security & IP

See SECURITY.md and LICENSE. Independent security review and customer-specific legal assessment are required before production financial use.

## Owner

EmergentSoft
