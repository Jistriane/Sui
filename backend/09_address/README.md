# Address

`address` é um identificador único de uma localização na blockchain. É usado para identificar pacotes, contas e objetos. Um `address` tem um tamanho fixo de 32 bytes e geralmente é representado como uma string hexadecimal com o prefixo `0x`. Os endereços não diferenciam maiúsculas de minúsculas.

```
0xe51ff5cd221a81c3d6e22b9e670ddf99004d71de4f769b0312b68c7c4872e2f1
```

O endereço acima é um exemplo de um `address` válido. Ele tem 64 caracteres (32 bytes) e o prefixo `0x`.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/09_address
>```

Acesse seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter o seguinte resultado:
```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Address
Running Move unit tests
[debug] @0x1
[debug] @0xbebe
[debug] @0x42
[debug] @0x0
[debug] "0000000000000000000000000000000000000000000000000000000000000000"
[debug] @0xbebe
[ PASS    ] 0x5a6f6e612054726573::address::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/address.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

### Sintaxe

Os endereços podem ser numéricos ou nomeados. A sintaxe de um `address` nomeado segue as mesmas regras de qualquer identificador nomeado em **Move**. A sintaxe de um endereço numérico não está restrita a valores codificados em hexadecimal, e qualquer valor numérico `u256` válido pode ser usado como valor de endereço, por exemplo, `42`, `0xBEBE` e `2024` são todos literais de endereço numérico válidos.

Para distinguir quando um endereço é usado em um contexto de expressão ou não, a sintaxe ao usar um endereço difere dependendo do contexto em que é usado:

* Quando um endereço é usado como expressão, ele deve ser precedido pelo caractere `@`, ou seja, `@<valor_numerico>` ou `@<identificador_endereco_nomeado>`.
* Fora dos contextos de expressão, o endereço pode ser escrito sem o caractere `@` inicial, ou seja, `<valor_numerico>` ou `<identificador_endereco_nomeado>`.

### Endereços nomeados

Os endereços nomeados são um recurso que permite o uso de identificadores em vez de valores numéricos em qualquer lugar onde os endereços são usados, e não apenas no nível do valor. Os endereços nomeados são declarados e vinculados como elementos de nível superior (fora de módulos e pacotes) nos pacotes Move, ou passados como argumentos para o compilador Move.

Os endereços nomeados existem apenas no nível da linguagem de origem e serão completamente substituídos por seu valor no nível do bytecode. Por causa disso, os módulos e os membros dos módulos devem ser acessados __através do endereço nomeado do módulo e não através do valor numérico__ atribuído ao endereço nomeado durante a compilação, por exemplo, usar `meu_endereco::foo` não é equivalente a usar `0x2::foo` mesmo que o programa Move seja compilado com `meu_endereco` definido como `0x2`.

### Operações de Armazenamento Global

O principal propósito do `address` é interagir com as operações do **armazenamento de objetos**. Os `address` são usados com as operações `take`, `borrow`, `borrow_mut` e `transfer`.

### Sender

`sender` é um tipo de recurso em Move. Um `sender` permite que o titular **aja** em nome de um determinado endereço. O Move pode criar qualquer valor de endereço sem nenhuma permissão especial usando literais de `address`:

```move
let a1 = 0x1;
let a2 = 0x2;
// ...
```

No entanto, `sender` é especial porque você não pode criá-lo usando literais ou instruções, mas acessamos esse valor através do contexto de uma transação.

## Desafio

Simplesmente leia a documentação e certifique-se de entendê-la.
