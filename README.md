# Kabu contract
<div align="center">

[![CI status](https://github.com/cakevm/kabu-contract/actions/workflows/ci.yml/badge.svg?branch=main)][gh-kabu]
[![Telegram Chat][tg-badge]][tg-url]

[gh-kabu]: https://github.com/cakevm/kabu-contract/actions/workflows/ci.yml
[tg-badge]: https://img.shields.io/badge/telegram-kabu-2C5E3D?style=plastic&logo=telegram
[tg-url]: https://t.me/joinkabu

</div>

The Kabu contract allows to interact with DEX pools for the Kabu backrunning bot. The contract is written in Huff using [huff-neo](https://github.com/cakevm/huff-neo) and used by [Kabu](https://github.com/cakevm/kabu).

## Getting Started
Clone this repository:
```sh
git clone --recurse-submodules git@github.com:cakevm/kabu-contract.git
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

## Acknowledgements
Many thanks to [dexloom](https://github.com/dexloom)! This project is a hard-fork from [multicaller](https://github.com/dexloom/multicaller). Many thanks to the [Huff](https://github.com/huff-language) community for creating this language and the [Foundry](https://github.com/foundry-rs/foundry) team for the awesome tooling.

## License
The project is licensed under [Unlicense](./LICENSE).