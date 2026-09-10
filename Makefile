.PHONY: test test-invariant deploy-sepolia seed-demo verify-publicly

test:
	forge test -vvv

test-invariant:
	forge test --match-test test_EnforcesInvariant_ExactSupplyMatchesSurfaceArea -vvv

deploy-sepolia:
	forge script script/Deploy.s.sol --rpc-url $(BASE_SEPOLIA_RPC) --broadcast

seed-demo:
	forge script script/SeedDemoAsset.s.sol --rpc-url $(BASE_SEPOLIA_RPC) --broadcast --private-key $(PRIVATE_KEY) -vv

verify-publicly:
	forge script script/VerifyPublicly.s.sol --rpc-url $(BASE_SEPOLIA_RPC) -vv
