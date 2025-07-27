# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Kabu is a DEX backrunning bot contract written in Huff assembly language using huff-neo. The contract serves as a sophisticated multicaller that can batch execute complex DeFi operations across multiple protocols (Uniswap V2/V3, Balancer V2, dYdX, etc.) with advanced stack-based computation capabilities.

## Core Architecture

### Main Components

- **`src/Multicaller.huff`**: Primary contract entry point with function dispatching for multiple callback interfaces (Uniswap, Balancer, dYdX, ERC1271, etc.)
- **Call Execution Layer**: `Call.huff`, `StaticCall.huff`, `DelegateCall.huff`, `InternalCall.huff` - handle different types of external calls
- **VM System**: `VMOpcodes.huff`, `VMStack.huff`, `VMCallStack.huff` - implement a custom stack-based virtual machine for calculations
- **Protocol Services**: `utils/service/` - contain protocol-specific implementations for Uniswap V2/V3 calculations
- **Internal Calls**: `utils/internalcalls/` - specialized handlers for flashloan callbacks and swap calculations

### Key Design Patterns

1. **Stack-Based VM**: The contract implements a custom virtual machine with opcodes for arithmetic, comparisons, and stack manipulation
2. **Callback Multiplexing**: Single contract handles callbacks from multiple DEX protocols through function signature matching
3. **Memory Management**: Sophisticated memory layout with stack pointer management at 0x0 and structured data copying
4. **Bitfield Encoding**: Extensive use of bitfield packing for call parameters and VM instructions

## Development Commands

### Environment Setup
```bash
export MAINNET_HTTP=<Your mainnet http endpoint>
```

### Testing
```bash
# Start local fork (required for tests)
make anvil

# Run all tests (in separate terminal)
make test

# Run specific test file
forge test --match-contract <TestContractName> --fork-url http://localhost:8545
```

### Code Quality
```bash
# Format Solidity files
make fmt
npm run fmt

# Check formatting
make fmt-check
npm run fmt-check

# Lint Solidity files
make lint
npm run lint

# Check linting
make lint-check
npm run lint-check
```

### Deployment
```bash
# Deploy to Anvil
forge script script/Deploy.s.sol --fork-url http://localhost:8545 --broadcast

# Deploy to mainnet (set private key and RPC URL)
forge script script/Deploy.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast --verify
```

## Huff-Specific Considerations

- **No Standard Library**: All functionality is implemented from scratch in assembly
- **Stack Management**: Complex stack manipulations require careful tracking of stack depth and element positioning
- **Gas Optimization**: Code is heavily optimized for minimal gas usage with manual assembly optimizations
- **Debugging**: Use `dup1 0x0 mstore 0x20 0x0 revert` pattern for debugging stack values
- **Magic Constants**: Many hardcoded values represent function selectors, bitmasks, or protocol-specific constants

## Testing Architecture

- **Fork Testing**: All tests run against mainnet fork at block 19101578
- **Multiple Protocols**: Tests cover Uniswap V2/V3, Balancer, dYdX, and other major protocols
- **Gas Benchmarking**: Dedicated gas optimization tests in `MulticallerGasBench.t.sol`
- **Callback Testing**: Extensive testing of flashloan and swap callback mechanisms

## Critical Security Notes

- Owner checks are commented out in main contract - verify this is intentional for production
- WETH withdrawal functions should validate caller permissions
- Reentrancy protection is not visible in current implementation
- Complex stack manipulations increase risk of stack over/underflow

## Common Patterns

- **Error Handling**: Most functions use `error jumpi` pattern for reverting on failure
- **Memory Layout**: Structured memory usage with specific offsets (0x100 for temporary storage, etc.)
- **Bitfield Decoding**: Extensive use of bit shifting and masking for parameter extraction
- **Protocol Integration**: Each DEX has specific calling conventions and callback patterns