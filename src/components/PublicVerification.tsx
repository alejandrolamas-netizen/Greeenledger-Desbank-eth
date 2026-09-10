import React from 'react';
import { useReadContract } from 'wagmi';
import { AIAttestationRegistryABI, RealEstateTokenABI } from '../abi/GreenLedgerABIs';

export default function PublicVerification({attestationAddress,tokenAddress,assetId,expectedDecisionHash}:{attestationAddress:`0x${string}`;tokenAddress:`0x${string}`;assetId:`0x${string}`;expectedDecisionHash:`0x${string}`}) {
  const {data:attestationData}=useReadContract({address:attestationAddress,abi:AIAttestationRegistryABI,functionName:'getAttestation',args:[assetId]});
  const {data:totalSupply}=useReadContract({address:tokenAddress,abi:RealEstateTokenABI,functionName:'totalSupply'});
  const {data:surface}=useReadContract({address:tokenAddress,abi:RealEstateTokenABI,functionName:'registeredSurfaceSqFt'});
  const attested=attestationData?.[0]===true;
  const hashMatch=attestationData?.[1]===expectedDecisionHash;
  const invariant=typeof totalSupply==='bigint'&&typeof surface==='bigint'&&totalSupply===surface*10n**18n;
  const checks=[['Attestation Exists',attested],['Decision Hash Match',hashMatch],['Token Supply Valid',typeof totalSupply==='bigint'&&totalSupply>0n],['Invariant Holds',invariant]] as const;
  return <section><h2>Public Verification</h2>{checks.map(([name,ok])=><div key={name}>{ok?'✓':'○'} {name}</div>)}<div>Supply: {typeof totalSupply==='bigint'?totalSupply.toString():'—'}</div><div>Surface: {typeof surface==='bigint'?surface.toString():'—'}</div><a href={`https://sepolia.basescan.org/address/${tokenAddress}`} target="_blank" rel="noreferrer">View Token on BaseScan ↗</a></section>;
}
