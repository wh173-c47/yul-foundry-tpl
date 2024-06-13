# Yul Foundry Template

Adapted from https://github.com/CodeForcer/foundry-yul

This repo is a basic boilerplate for pure Yul smart contract development, it also includes a create2 deployment script and multichain deployment handling.

## Setting up

### Solc

To successfully compile and test this project, you will need to install solc.

#### Debian

1. Head to [ethereum's solidity releases](https://github.com/ethereum/solidity/releases) and download the **solc-static-linux**.
2. Run the following commands
```bash
chmod +x solc-static-linux
sudo mv solc-static-linux /usr/local/bin/solc
```
3. Verify the installation
```bash
solc --version
```

### Boilerplate

Feel free to adjust the following:

1. **script/Contract.s.sol**

Deployment script name, including constructor param handling if any and associated Contract name for compilation in the **bashCommand**.

2. **test/Contract.t.sol**

Tests, name of the contracts.

3 **test/mocks/Contract.sol**

Interface of the Yul contract, associated methods.

4. **yul/Contract.yul**

Yul contract name and code.

5. **scripts/deploy_multi.sh**

Name of the deployment file and contract.
