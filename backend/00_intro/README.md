# Introdução

## Módulos e Pacotes

**Move** na Sui tem dois tipos diferentes de programas: Módulos e Pacotes.

Move é uma linguagem para escrever contratos inteligentes, programas que são armazenados e executados na blockchain. Um programa é organizado em um pacote. Um pacote é publicado na blockchain e identificado por um endereço. É possível interagir com um pacote publicado enviando transações que chamam suas funções. Ele também pode atuar como uma dependência para outros pacotes.

Um módulo é a unidade básica de organização de código em Move. Os módulos são usados para agrupar e isolar código, e todos os membros do módulo são privados para o módulo por padrão.

Nesta seção, você aprenderá como definir um módulo, declarar seus membros e acessá-lo a partir de outros módulos.

Módulo:
* Contém funções e tipos.

Pacote:
* Conjunto de módulos.

Nos tutoriais a seguir, trabalharemos na maior parte do tempo **apenas com módulos**.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/00_intro
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
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introducao::pratica_sui::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

Parabéns! :partying_face: Você acabou de executar com sucesso seu primeiro módulo Move. Agora, vamos analisar o que está acontecendo.

Na pasta `sources`, podemos encontrar um arquivo chamado `introducao.move`. Este arquivo, como a extensão indica, contém o código Move que estamos executando. Neste caso, é um **módulo** com uma **função** e um **teste**.

## Estrutura de um módulo

A estrutura de um **módulo** é a seguinte:

```rust
module endereco::nome_do_modulo {
    // ...  resto do código
}
```

1. Declaração do módulo com a palavra-chave `module`.
2. Endereço no qual o módulo será implantado.
    O endereço pode ser encontrado no arquivo de configuração `Move.toml`, na seção `addresses`. No nosso caso:
    ```toml
    [addresses]
    introduccion = "0x5A6F6E612054726573"
    ```
3. Nome do módulo, no nosso caso: `practica_sui`

Portanto, nosso código fica assim:
```rust
module introduccion::practica_sui {
    // ...  resto do código
}
```

Em seguida, vêm os `imports` ou os módulos/bibliotecas que estamos importando para que o nosso funcione. Em nosso código, estamos importando duas funções da biblioteca principal da **Sui**:

```rust
    use std::debug::print;
    use std::string::utf8;
```

A função para imprimir no console é importada, assim como uma função para converter strings de texto para um formato aceito pela função anterior. Veremos isso mais adiante nesta série de tutoriais.

A próxima seção de código inclui nossa primeira função:

```rust
    fun practica() {
        print(&utf8(b"Hello, World!"));
    }
```

Nela, fazemos uso de ambas as bibliotecas importadas. A função simplesmente imprime a string `Hello, World!` no console.

E, por último, precisamos de uma forma de executar esta função. Por enquanto, estamos fazendo isso através de um **bloco de teste** ou `test`:

```rust
    #[test]
    fun teste() {
        practica();
    }
```

Ao executarmos `sui move test`, estamos dizendo à CLI para executar todas as funções que têm um bloco `[#test]`, neste caso, ele executa nossa função `teste`, que por sua vez chama a função `pratica`.

## Saída

Por fim, vamos analisar o resultado que foi impresso no console.

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
Running Move unit tests
[debug] "Hello, World!"
[ PASS    ] introducao::pratica_sui::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

O primeiro bloco de texto nos informa que está incluindo as dependências necessárias para executar o projeto:

```sh
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING Intro
```

Essas dependências são as dependências básicas que todo pacote em **Move** precisa, então o compilador as importa automaticamente.
Você pode verificar que não estamos importando nenhuma dependência no arquivo `Move.toml` na seção `[dependencies]`.

A próxima linha na saída nos diz que os testes de unidade no arquivo serão executados, lembre-se que isso ocorre porque executamos o comando `sui move test`:
```
Running Move unit tests
```

Em seguida, obtemos a mensagem que a função de teste executa, no nosso caso, a linha de texto `Hello, World!`:
```sh
[debug] "Hello, World!"
```

Agora, na próxima linha, podemos obter informações sobre exatamente quais funções foram executadas:
```sh
[ PASS    ] introducao::pratica_sui::teste
```
A estrutura é algo como:
```rust
endereco::nome_do_modulo::funcao
```
Com isso, podemos verificar que a função que foi executada foi `teste`.

Por fim, obtemos informações sobre os testes de unidade, como quantos foram executados e quantos passaram:

```sh
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Desafio Final

Como desafio final, modifique a função para que, em vez de exibir `Hello, World!`, ela imprima o logo da **Sui** em arte ASCII:
```ASCII
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
================================================:..:================================================
===============================================......-==============================================
=============================================-..    ..:=============================================
============================================....    ....============================================
==========================================-..............:==========================================
=========================================.......:==:.......=========================================
=======================================-.......-====-.......:=======================================
======================================:.    .:========:.    ..-=====================================
====================================-.......:==========-.......:====================================
===================================.........=============:... ...===================================
=================================-.........================..   ..:=================================
================================....    ..:=================:.......================================
==============================-.....    ..:==================-.......:==============================
=============================:............:====================:.......=============================
===========================-.......-.......=====================-.......-===========================
==========================-.......==:......-======================:.... .-==========================
=========================-......:====.......-======================-......-=========================
=========================......:=====-.......:======================-......=========================
========================:......=======-... ....:=====================:.....:========================
========================......-=========.........:-===================......========================
=======================-    ..===========-..........:-================:.    :=======================
=======================:    .:=============-...........:==============-.    :=======================
=======================:    .:================:.....    ..-===========-.    .=======================
=======================:    .:==================-:..    ...:==========:.    :=======================
=======================-.  ...=====================-:...    .:========..    :=======================
========================......-=======================:.    ...=======..    -=======================
========================:.. ...=========================........=====.......========================
=========================......:=========================:......:===:......-========================
=========================-......:=========================.......-=:......:=========================
==========================:.    ..-=======================-.    ....    .:==========================
===========================:.......:=======================.    ........:===========================
============================-...    ..=====================:        ...-============================
==============================:.    ....:-================-.        ..==============================
================================:...    .....::------::.....    ....================================
==================================:.    ....................    .:-=================================
====================================-:........................:-====================================
========================================-:................:-========================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
====================================================================================================
```

> :information_source: Lembre-se de salvar suas alterações no arquivo para depois fazer o `push` para o seu repositório do **Github**.
