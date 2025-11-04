# Habilidades

As habilidades são uma característica de tipagem em Move que controla quais ações são permitidas para os valores de um determinado tipo. Este sistema garante um controle detalhado sobre o comportamento de tipagem "linear" dos valores, bem como se os valores são usados no armazenamento persistente da cadeia (também conhecido como **Object Store** na Sui) e como. Isso é implementado bloqueando o acesso a certas instruções de bytecode, de modo que, para que um valor possa ser usado com a instrução de bytecode, ele deve ter a habilidade necessária, se alguma for necessária. Nem todas as instruções são bloqueadas por uma habilidade.

As habilidades fazem parte da declaração de um `struct` e definem os comportamentos permitidos para as instâncias desta estrutura.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/08_habilidades
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
BUILDING Habilidades
Running Move unit tests
[ PASS    ] suiz3::habilidades::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/habilidades.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

### Sintaxe

|Habilidade|Descrição|
|---|---|
|`copy`|Permite que valores com esta habilidade sejam copiados.|
|`drop`|Permite que valores com esta habilidade sejam descartados.|
|`store`|Permite que valores com esta habilidade possam ser armazenados dentro de outros objetos.|
|`key`|Permite que o tipo seja gerenciado como um objeto independente na blockchain, com seu próprio ID e proprietário.|

As habilidades são estabelecidas na definição do `struct` usando a palavra-chave `has` seguida por uma lista de habilidades. As habilidades são separadas por vírgulas. Move suporta 4 habilidades: `copy`, `drop`, `key`, e `store`, cada uma delas é usada para definir um comportamento específico para as instâncias da estrutura.

```move
/// Este `struct` tem as habilidades `copy` e `drop`.
struct Estrutura has copy, drop {
    // campo1: Tipo1,
    // campo2: Tipo2,
    // ...
}
```

### `copy`

A habilidade `copy` permite copiar valores de tipos com essa habilidade. Permite copiar valores de variáveis locais com o operador `copy` e copiar valores por desreferenciação `*e`.

Se um valor tem `copy`, todos os valores contidos dentro desse valor têm `copy`.

### `drop`

A habilidade `drop` permite descartar valores de tipos com essa habilidade. Por descartar, queremos dizer que o valor não é transferido e é efetivamente destruído enquanto o programa Move é executado. Como tal, esta habilidade dá a possibilidade de **ignorar** valores em uma infinidade de lugares, incluindo:
* não usar o valor em uma variável local ou parâmetro
* não usar o valor em um bloco por meio de ;
* sobrescrever valores em variáveis
* sobrescrever valores por meio de referências ao escrever `*e1` = `e2`.

Se um valor tem `drop`, todos os valores contidos dentro desse valor têm `drop`.

### `store`

A habilidade `store` permite que os valores dos tipos com esta habilidade existam dentro de uma estrutura (objeto), mas não necessariamente como um objeto independente no **armazenamento persistente**. Esta é a única habilidade que não bloqueia diretamente uma operação. Em vez disso, bloqueia o armazenamento na cadeia quando usada em conjunto com `key`.

Se um valor tem `store`, todos os valores contidos dentro desse valor também devem ter `store`.

### `key`

A habilidade `key` permite que o tipo sirva como um **objeto independente** no armazenamento persistente da cadeia. Permite todas as operações relacionadas ao gerenciamento de objetos na cadeia, portanto, para que um tipo possa ser usado como um objeto gerenciado pela Sui, ele deve ter a habilidade `key`. Observe que as operações devem ser usadas no módulo em que o tipo `key` é definido (as operações são privadas para o módulo que as define).

Se um valor tem `key`, todos os valores contidos dentro desse valor devem ter `store`. Esta é a única habilidade com este tipo de assimetria.

### Tipos primitivos

A maioria dos tipos primitivos tem `copy`, `drop` e `store`, com exceção de `signer`, que só tem `drop`.

* `bool`, `u8`, `u16`, `u32`, `u64`, `u128`, `u256`, e `address` têm `copy`, `drop`, e `store`.
* `signer` tem `drop`.
    * Não pode ser copiado e não pode ser salvo no armazenamento persistente.
* `vector<T>` pode ter `copy`, `drop` e `store` dependendo das capacidades de `T`.
* As referências imutáveis `&` e as referências mutáveis `&mut` têm ambas `copy` e `drop`.
    * Isso se refere a copiar e descartar a própria referência, não ao que elas estão referenciando.
    * As referências não podem aparecer no armazenamento persistente, pois não têm `store`.
* **Nenhum** dos tipos primitivos tem `key`, o que significa que nenhum deles pode ser usado diretamente como objetos armazenáveis na cadeia.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre as habilidades na [documentação](https://move-language.github.io/move/abilities.html) oficial da linguagem Move.

## Desafio

Simplesmente leia a documentação e certifique-se de entendê-la. A partir daqui, a maioria dos exercícios terá tipos com habilidades, por isso é importante que você pelo menos identifique cada uma e sua função.
