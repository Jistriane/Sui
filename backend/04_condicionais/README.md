# Condicionais

As funções condicionais são usadas para tomar decisões em um programa. Elas podem executar blocos de código dependendo do resultado ou avaliar condições para continuar ou abortar a execução de um módulo.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/04_condicionais
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
BUILDING Condicionais
Running Move unit tests
[debug] "a e maior que 0"
[debug] "a nao e maior que 20"
[debug] 10
[debug] "Usuario tem acesso."
[ PASS    ] suiz3::condicionais::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### If Else

A expressão `if` é usada para tomar decisões em um programa. Ela avalia uma expressão booleana e executa um bloco de código se a expressão for verdadeira. Juntamente com `else`, pode executar um bloco de código diferente se a expressão for falsa.

A sintaxe da expressão if é:

```rust
if (<expressao_bool>) <expressao>;
```
```rust
if (<expressao_bool>) <expressao> else <expressao>;
```

ou

```rust
if (<expressao_bool>) {
  <expressao>
};
```
```rust
if (<expressao_bool>) {
  <expressao>
} else {
  <expressao>
};
```

### Abort

A palavra-chave `abort` é usada para abortar a execução de uma função. É usada juntamente com um código de aborto, que será retornado a quem chama a função. O código de aborto é um inteiro do tipo `u64`.

```rust
if (<expressao_bool>) {
  abort <codigo_de_erro>
};
```
ou
```rust
if (<expressao_bool>) {
  abort(<codigo_de_erro>)
};
```

### Assert

`assert!` é uma macro que pode ser usada para afirmar uma condição. Se a condição for falsa, a execução da função será cancelada com o código de aborto fornecido. A macro `assert!` é uma forma prática de abortar uma função se uma condição não for atendida. A macro encurta o código que, de outra forma, seria escrito com uma expressão `if` + `abort`. O argumento do código é obrigatório e deve ser um valor `u64`.

```rust
assert!(<expressao_bool>, <codigo_de_erro>);
```

### Códigos de erro

Para tornar os códigos de erro mais descritivos, é uma boa prática definir **constantes de erro**. Elas são definidas como declarações `const` e geralmente são prefixadas com `E` seguido por um nome em `camel case`. As **constantes de erro** não são diferentes de outras constantes e não têm tratamento especial, no entanto, são usadas para aumentar a legibilidade do código e facilitar a compreensão dos cenários de aborto.

```rust
const ECodigoDeErro: u64 = <codigo_de_erro>;
```
ou
```rust
const ECodigoDeErro1: u64 = 1;
const ECODIGO_DE_ERRO_2: u64 = 2;
```

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/condicionais.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

## Desafio

* Crie uma constante de erro com o valor que desejar para indicar que o usuário é menor de idade.
* Crie uma variável que represente uma idade.
* Avalie esta variável em um bloco condicional usando `if` e `else`:
  * Se o usuário for maior de idade, imprima uma mensagem para informá-lo de que ele pode acessar o conteúdo do seu programa.
  * Se o usuário **não** for maior de idade, aborte a execução enviando o código de erro que você criou no início.
* Faça essa mesma avaliação usando `assert`. Lembre-se de que `assert` não retorna nenhuma mensagem, mas retorna um número como código de erro.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer o `push` para o seu repositório do **Github**.
