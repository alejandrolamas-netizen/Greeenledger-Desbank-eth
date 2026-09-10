# GreenLedger EVM — Master Specification

## 1. Isolation

GreenLedger follows a strict parallel architecture:

- XRPL implementation remains frozen and untouched.
- EVM implementation is developed independently on Base.
- Business logic is shared conceptually, while settlement adapters remain network-specific.

## 2. EVM target

- Base Mainnet: `8453`
- Base Sepolia: `84532`
- Base Sepolia RPC: `https://sepolia.base.org`
- BaseScan: `https://basescan.org`
- Base Sepolia explorer: `https://sepolia.basescan.org`

## 3. Core business rules

- Asset identifier: `RE-{TYPE}-{CITY}-{SEQ}`
- Core invariant: `1 token = 1 square foot`
- Reference demo asset: `RE-COM-NYC-001`
- Reference demo size: `50,000 sq ft`

## 4. Target contract architecture

The project specification defines the following Solidity components:

- `GreenLedgerFactory.sol`
- `RealEstateToken.sol`
- `IdentityRegistry.sol`
- `ComplianceRegistry.sol`
- `OracleManager.sol`
- `AIAttestation.sol`
- `Escrow.sol`
- `Treasury.sol`

The intended architecture also includes a Go settlement interface, an EVM settlement adapter, QAIzero intelligence, Sentinel policy/compliance enforcement, AetherOS security/signing, and The Graph indexing.

## 5. Planned application layout

```text
greenledger-evm/
├── apps/
│   ├── api/
│   ├── dashboard/
│   └── worker/
├── contracts/
├── services/
├── ai/qaizero/
├── security/
│   ├── aetheros/
│   └── sentinel/
├── indexer/subgraph/
├── infrastructure/
├── docs/
└── tests/
```

## 6. Implementation roadmap

1. Repository isolation and EVM environment.
2. Solidity contract architecture.
3. Factory and deterministic deployment design.
4. EVM settlement adapter.
5. Sentinel compliance integration.
6. QAIzero / AI-attestation integration.
7. Oracle integration.
8. Indexing.
9. Backend services.
10. Dashboard.
11. Security and fuzz testing.
12. Base Sepolia deployment and verification.
13. Infrastructure integration.
14. End-to-end testing.
15. Production-readiness audit and Base Mainnet package.

## 7. Evidence policy

Architecture and roadmap documents are specifications. They do not, by themselves, establish that contracts have been deployed, verified, or queried successfully.

The repository must record real deployment addresses, transaction hashes, test results, and explorer verification only when those artifacts have been independently produced and checked.

## 8. Demo dashboard note

The supplied dashboard artifact is a demonstration interface. Its wallet actions currently use self-addressed transactions carrying encoded demo data rather than a verified call to a deployed `AIAttestation` or factory contract. Its verification display is also demonstration logic rather than a live contract-state proof. Therefore it must be labeled and treated as a demo until real contract integration is completed.
