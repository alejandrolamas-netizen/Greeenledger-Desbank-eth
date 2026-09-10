export const AIAttestationRegistryABI = [
  { type: 'function', name: 'attest', inputs: [
    { name: 'assetId', type: 'bytes32' }, { name: 'decisionHash', type: 'bytes32' },
    { name: 'modelVersion', type: 'string' }, { name: 'riskGrade', type: 'string' },
    { name: 'valuation', type: 'uint256' }
  ], outputs: [{ name: 'attestationId', type: 'bytes32' }], stateMutability: 'nonpayable' },
  { type: 'function', name: 'getAttestation', inputs: [{ name: 'assetId', type: 'bytes32' }], outputs: [
    { name: '', type: 'bool' }, { name: '', type: 'bytes32' }
  ], stateMutability: 'view' },
  { type: 'function', name: 'isAttested', inputs: [
    { name: 'assetId', type: 'bytes32' }, { name: 'decisionHash', type: 'bytes32' }
  ], outputs: [{ name: '', type: 'bool' }, { name: '', type: 'address' }], stateMutability: 'view' },
  { type: 'event', name: 'AssetAttested', inputs: [
    { name: 'assetId', type: 'bytes32', indexed: true }, { name: 'decisionHash', type: 'bytes32', indexed: false },
    { name: 'modelVersion', type: 'string', indexed: false }, { name: 'riskGrade', type: 'string', indexed: false },
    { name: 'valuation', type: 'uint256', indexed: false }, { name: 'timestamp', type: 'uint256', indexed: false },
    { name: 'attestor', type: 'address', indexed: true }
  ], anonymous: false }
] as const;

export const RealEstateTokenABI = [
  { type: 'function', name: 'executeTokenization', inputs: [{ name: 'recipient', type: 'address' }], outputs: [], stateMutability: 'nonpayable' },
  { type: 'function', name: 'totalSupply', inputs: [], outputs: [{ name: '', type: 'uint256' }], stateMutability: 'view' },
  { type: 'function', name: 'registeredSurfaceSqFt', inputs: [], outputs: [{ name: '', type: 'uint256' }], stateMutability: 'view' },
  { type: 'function', name: 'isTokenized', inputs: [], outputs: [{ name: '', type: 'bool' }], stateMutability: 'view' },
  { type: 'event', name: 'AssetTokenized', inputs: [
    { name: 'assetId', type: 'bytes32', indexed: true }, { name: 'totalSupply', type: 'uint256', indexed: false },
    { name: 'attester', type: 'address', indexed: true }
  ], anonymous: false }
] as const;
