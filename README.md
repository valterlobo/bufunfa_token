# Bufunfa Token

Projeto básico para um token chamado "Bufunfa" usando o padrão ERC-20 em Solidity.

Esse projeto incluirá um contrato inteligente para o token Bufunfa, juntamente com algumas informações básicas.

## Detalhes do Token

- **Nome**: Bufunfa
- **Símbolo**: BFN
- **Decimais**: 18
- **Suprimento Total**: 1.000.000 BFN

## Implantação do Contrato

Para implantar o contrato, você precisará de um ambiente de desenvolvimento Ethereum, como o Foundry

### 1. Configurar o .env (template .env.example)

### 2. Compile o contrato

```shell
forge build
```

### 3. Executar os testes do contrato

  ```shell
  forge test
 ```

### 4. Executar o script de "Deploy" do contrato

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

forge script script/DeployToken.s.sol:NFTDeployScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv

### 5. Obter o endereço do contrato e pesquisar na ..scan

## Interação com o Contrato

Após a implantação, você pode interagir com o contrato usando a interface do Remix ou outras ferramentas como Web3.js ou Ethers.js. Aqui estão algumas operações que você pode realizar:

- **Verificar o saldo de uma conta**: Use a função `balanceOf(address)` com o endereço da conta.
- **Transferir tokens**: Use a função `transfer(address, uint256)` com o endereço do destinatário e a quantidade de tokens.
- **Aprovar um gasto**: Use a função `approve(address, uint256)` com o endereço do gastador e a quantidade permitida.
- **Transferir tokens em nome de outro usuário**: Use a função `transferFrom(address, address, uint256)` com os endereços do remetente, destinatário e a quantidade de tokens.

## O que é ERC-20 ?

O ERC-20 é um padrão técnico usado para a implementação de tokens no blockchain Ethereum. Esse padrão define uma lista comum de regras que todos os tokens Ethereum devem seguir. O ERC-20 é um dos padrões mais utilizados e permite que desenvolvedores programem como novos tokens serão utilizados na rede Ethereum. Ele estabelece uma interface básica que qualquer contrato inteligente deve implementar, o que garante a interoperabilidade entre diferentes tokens e aplicações descentralizadas (dApps).

### Funcionalidades do ERC-20

O padrão ERC-20 define seis funções principais que todos os contratos de tokens devem implementar:

1. **totalSupply**: Retorna o total de tokens em circulação.
2. **balanceOf**: Retorna o saldo de uma conta específica.
3. **transfer**: Transfere uma quantidade de tokens para um endereço específico.
4. **transferFrom**: Transfere tokens de uma conta para outra, mediante aprovação.
5. **approve**: Aprova uma conta para gastar uma quantidade específica de tokens em nome do dono dos tokens.
6. **allowance**: Retorna a quantidade de tokens que uma conta tem permissão para gastar em nome de outra conta.

### Eventos do ERC-20

Além das funções, o padrão ERC-20 também define dois eventos que devem ser emitidos:

1. **Transfer**: Emitido quando tokens são transferidos de uma conta para outra.
2. **Approval**: Emitido quando o dono dos tokens aprova uma conta para gastar tokens em seu nome.

### Benefícios do ERC-20

- **Interoperabilidade**: Tokens ERC-20 podem ser facilmente integrados em exchanges, carteiras e outras aplicações descentralizadas.
- **Padrão**: Seguir um padrão comum facilita o desenvolvimento e a implementação de novos tokens.
- **Popularidade**: Devido à sua ampla adoção, existem muitos recursos e ferramentas disponíveis para desenvolvimento com ERC-20.

### Referências

PADRÃO DE TOKEN ERC-20 
<https://ethereum.org/pt-br/developers/docs/standards/tokens/erc-20/>

ERC-20: Token Standard
<https://eips.ethereum.org/EIPS/eip-20>

Foundry
<https://book.getfoundry.sh/>
