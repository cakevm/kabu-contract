# Multicaller by DexLoom
<div align="center">

[![CI status](https://github.com/dexloom/multicaller/actions/workflows/ci.yml/badge.svg?branch=main)][gh-multicaller]
[![Telegram Chat][tg-badge]][tg-url]

[gh-multicaller]: https://github.com/dexloom/multicaller/actions/workflows/ci.yml
[tg-badge]: https://img.shields.io/badge/telegram-dexloom_com-2CA5E0?style=plastic&logo=telegram
[tg-url]: https://t.me/dexloom_com

</div>

The Multicaller contract allows to interact with DEX pools in a very efficient way for e.g. arbitrage. The contract is written in [Huff](https://github.com/huff-language) and used by [loom](https://github.com/dexloom/loom).

## Getting Started
First install [Foundry](https://github.com/foundry-rs/foundry) and  the [Huff Neo Compiler](https://github.com/cakevm/huff-neo). Then clone this repository:
```sh
git clone --recurse-submodules git@github.com:dexloom/multicaller.git
```

### Run tests
To run the tests open two shells and run:
```sh
export MAINNET_HTTP=<Your mainnet http endpoint>
make anvil
```
and
```sh
export MAINNET_HTTP=<Your mainnet http endpoint>
make test
```

### Deploy local
Start your local anvil, add the private key from anvil to `deploy.sh` and deploy the contract using:
```sh
./deploy.sh
```


## Acknowledgements
Many thanks to the [Huff](https://github.com/huff-language) community for creating this language and the [Foundry](https://github.com/foundry-rs/foundry) team for the awesome tooling.

## License
The project is licensed under [Unlicense](./LICENSE).



