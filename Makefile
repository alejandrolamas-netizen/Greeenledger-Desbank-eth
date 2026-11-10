.PHONY: test test-invariant deploy-sepolia seed-demo verify-publicly

test:
	forge test -vvv

test-invariant:
	forge test --match-path test/GreenLedgerSecurityProperties.t.sol -vvv

deploy-sepolia:
	forge script script/Deploy.s.sol:DeployScript --rpc-url $(BASE_SEPOLIA_RPC) --broadcast

seed-demo:
	forge script script/SeedDemoAsset.s.sol:SeedDemoAssetScript --rpc-url $(BASE_SEPOLIA_RPC) --broadcast -vv

verify-publicly:
	forge script script/VerifyPublicly.s.sol:VerifyPubliclyScript --rpc-url $(BASE_SEPOLIA_RPC) -vv
