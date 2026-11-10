# GreenLedger / Desbank — Ethereum/Base Commercial Readiness

## Current positioning

This repository is the Ethereum-compatible implementation track for GreenLedger / Desbank and includes Base / Base Sepolia deployment tooling. It is not evidence of a live network deployment or a production financial service.

The Ethereum/Base contracts currently implement an AI-attestation-gated ERC-20 tokenization flow and a surface-to-supply invariant. The current registry is materially less hardened than the Arbitrum track. Treat this as an engineering baseline, not a customer-ready deployment.

## Commercial product boundary

GreenLedger is the proposed asset-evidence and tokenization-control layer. Desbank is a separate proposed workflow/financial-rail layer. Initial commercial work should be limited to discovery, architecture, implementation services and controlled testnet pilots.

Do not market the repository as providing:
- active liquidity, collateralized lending or yield;
- deposits, exchange, redemption or custody;
- legal title, beneficial ownership or a right to cash flows;
- audited or regulator-approved infrastructure;
- bank integrations or production customer deployments.

## Minimum customer pilot prerequisites

- named asset class, customer, jurisdiction and intended legal effect;
- qualified legal review of asset rights, token transfer and offering structure;
- approved data model that keeps personal/confidential documents off-chain;
- security parity with the Arbitrum baseline, independently tested in this repository;
- threat model, key governance and incident procedure;
- testnet-only demonstration with synthetic data until separately approved;
- reproducible build, deployment evidence and explorer verification;
- network-specific indexer and operational runbook;
- signed scope, exclusions, responsibilities and acceptance criteria.

## Suggested commercial sequence

1. Discovery and architecture assessment.
2. Fixed-scope design-partner pilot.
3. Testnet workflow validation after approval.
4. Independent security and legal review.
5. Production decision as a separate gated project.

## Cross-network rule

Ethereum/Base and Arbitrum are separate deployments and separate source histories. A contract, test, deployment, audit or customer result on one network must not be represented as evidence for the other.
