# Deployment

## Deploy to Anvil (Local Testing)

1. Start Anvil:
```bash
anvil
```

2. Deploy the contract:
```bash
forge script script/Deploy.s.sol --fork-url http://localhost:8545 --broadcast
```

The deployed address will be shown in the output.

## Deploy to Mainnet

1. Set environment variables:
```bash
export PRIVATE_KEY=your_private_key
export RPC_URL=https://eth-mainnet.alchemyapi.io/v2/your_api_key
```

2. Deploy the contract:
```bash
forge script script/Deploy.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```

3. Wait for deployment confirmation and note the deployed address.

## Verify Contract (Optional)

If verification failed during deployment, you can verify manually:
```bash
forge verify-contract <deployed_address> src/Multicaller.huff --etherscan-api-key <your_etherscan_api_key>
```