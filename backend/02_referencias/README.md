# Referências

Move tem dois tipos de referências: imutáveis `&` e mutáveis `&mut`. As referências imutáveis são somente de leitura e não podem modificar seu valor (ou qualquer um de seus campos). As referências mutáveis permitem modificações através de uma escrita por meio dessa referência. O sistema de tipos de Move impõe uma disciplina de propriedade (`ownership`) que evita erros de referência.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/02_referencias
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
BUILDING Referencias
Running Move unit tests
[debug] 1
[debug] 7
[debug] 1
[debug] 1
[debug] 1
[debug] 20
[debug] 20
[ PASS    ] suiz3::referencias::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### Operadores

Você deve ter notado que nas lições anteriores, para usar um valor, como nas funções para imprimir no console, um *ampersand* `&` é colocado antes das variáveis. Isso é o que chamamos de referência. Se removermos esse símbolo, o compilador indicará um erro, pois a variável não pertence a esse escopo, ou seja, precisamos dizer ao compilador que a função `print` vai "pegar emprestado" esse valor para poder usá-lo.

Move fornece operadores para criar e estender referências, bem como para converter uma referência mutável em uma imutável. Usaremos a notação `e: T` para "expressão" `e` tem tipo `T`.

|Sintaxe|Tipo|Descrição|
|---|---|---|
|`&e` | `&T` onde `e: T` e `T` é um tipo não referenciado.| Cria uma referência **imutável** de `e`.|
|`&mut e` | `&mut T` onde `e: T` e `T` é um tipo não referenciado.|	Cria uma referência **mutável** de `e`.|
|`&e.f` | `&T` onde `e.f: T` | Cria uma referência **imutável** para o campo `f` da `struct` `e`.|
|`&mut e.f` |	`&mut T` onde `e.f: T` |	Cria uma referência **mutável** para o campo `f` da `struct` `e`.|
| `freeze(e)` |	`&T` onde `e: &mut T` | Converte a referência **mutável** `e` para uma referência **imutável**.

### Lendo e escrevendo através de referências

Tanto as referências mutáveis quanto as imutáveis podem ser lidas para produzir uma cópia do valor referenciado.

Apenas as referências mutáveis podem ser escritas. Uma escrita *x = v descarta o valor armazenado anteriormente em x e o atualiza com v.

|Sintaxe|Tipo|Descrição|
|---|---|---|
| `*e` | `T` onde `e` é `&T` ou `&mut T` | Lê o valor apontado por `e` |
|`*e1 = e2` | `()` onde `e1: &mut T` e `e2: T` | Atualiza o valor de `e1` com o de `e2` |

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/referencias.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.
