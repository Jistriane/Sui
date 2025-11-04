# Funções

As funções são os blocos de construção dos programas Move. Elas são chamadas a partir de transações de usuário e de outras funções e agrupam o código executável em unidades reutilizáveis. As funções podem receber argumentos e retornar um valor. Elas são declaradas com a palavra-chave `fun` no nível do módulo. Como qualquer outro membro de um módulo, por padrão, elas são privadas e só podem ser acessadas de dentro do próprio módulo. No entanto, é possível alterar esse comportamento com modificadores de visibilidade.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/10_funcoes
>```

Acesse seu terminal e execute o seguinte comando:

```sh
sui move test
```

Você deve obter algo semelhante a isto:
```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Funcoes
Running Move unit tests
[debug] false
[debug] 1
[debug] 2
[ PASS    ] suiz3::funcoes1::teste
[debug] "Ola de funcoes1!"
[debug] "Sui"
[debug] 0
[debug] 100
[debug] "Ola de funcoes1!"
[debug] "Ola de funcoes1!"
[debug] "Ola de funcoes1!"
[ PASS    ] suiz3::funcoes3::teste
[debug] 200
[ PASS    ] suiz3::funcoes2::teste
[ PASS    ] suiz3::funcoes4::teste
Test result: OK. Total tests: 4; passed: 4; failed: 0
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/funcoes.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre as habilidades na [documentação](https://move-book.com/move-basics/function) oficial da linguagem Move.

## Desafio

Simplesmente leia a documentação e certifique-se de entendê-la. A partir de agora, a maioria dos tutoriais contará com múltiplas funções.
