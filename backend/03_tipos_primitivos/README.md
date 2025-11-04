# Tipos primitivos

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/03_tipos_primitivos
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
BUILDING Tipos primitivos
Running Move unit tests
[debug] 1
[debug] 2
[debug] 3
[debug] 1123456
[debug] 51966
[debug] 3200187904
[debug] true
[debug] false
[debug] true
[debug] false
[ PASS    ] suiz3::tipos_primitivos::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

### Inteiros (Integers)

Move suporta seis tipos de inteiros sem sinal: `u8`, `u16`, `u32`, `u64`, `u128` e `u256`. Os valores desses tipos vão de 0 a um máximo que depende do tamanho do tipo.

|Tipo|Intervalo de valor|
|---|---|
| Inteiro de 8-bits sem sinal, `u8` | 0 a 2<sup>8</sup> -1 |
| Inteiro de 16-bits sem sinal, `u16` | 0 a 2<sup>16</sup> -1 |
| Inteiro de 32-bits sem sinal, `u32` | 0 a 2<sup>32</sup> -1 |
| Inteiro de 64-bits sem sinal, `u64` | 0 a 2<sup>64</sup> -1 |
| Inteiro de 128-bits sem sinal, `u128` | 0 a 2<sup>128</sup> -1 |
| Inteiro de 256-bits sem sinal, `u256` | 0 a 2<sup>256</sup> -1 |

### Valores literais (literals)

Os valores literais para esses tipos são especificados como uma sequência de dígitos (por exemplo, `123`) ou como literais hexadecimais, por exemplo, `0xAA`. O tipo do literal pode ser adicionado opcionalmente como um sufixo, por exemplo, `123u8`. Se o tipo não for especificado, o compilador tentará inferi-lo do contexto em que o literal é usado. Se o tipo não puder ser inferido, assume-se que seja `u64`.

Literais numéricos podem ser separados por sublinhados para agrupá-los e facilitar a leitura. (por exemplo,`1_234_5678`, `1_000u128`, `0xAB_CD_12_35`).

Se um literal for muito grande para o intervalo de tamanho especificado (ou inferido), um erro é gerado.

### Operações aritméticas

Para todas essas operações, ambos os argumentos (os operandos esquerdo e direito) devem ser do mesmo tipo. Se você precisar operar inteiros de tipos diferentes, terá que converter um deles primeiro.

Todas as operações aritméticas abortam em vez de se comportarem como inteiros matemáticos não se comportariam (por exemplo, overflow, underflow, divisão por zero).

|Sintaxe|Operação|Aborta se...|
|---|---|---|
|+| Adição | O resultado é muito grande para o tipo de dado. |
|-| Subtração | O resultado é menor que `0` |
|*| Multiplicação | O resultado é muito grande para o tipo de dado. |
|/| Divisão | O divisor é `0` |
|%| Módulo | O divisor é `0` |

### Comparações

Os tipos inteiros são os *únicos* tipos em Move que podem usar os operadores de comparação. Ambos os argumentos devem ser do mesmo tipo. Se você precisar comparar inteiros de tipos diferentes, terá que converter um deles primeiro.

|Sintaxe|Operação|
|---|---|
|<| Menor que |
|>| Maior que |
|<=| Menor ou igual que |
|>=| Maior ou igual que |

### Igualdades

Ambos os argumentos devem ser do mesmo tipo. Se você precisar comparar inteiros de tipos diferentes, terá que converter um deles primeiro.

|Sintaxe|Operação|
|---|---|
|==| Igual|
|!=| Não igual|

### Conversão (Cast)

Tipos inteiros de um tamanho podem ser convertidos em tipos inteiros de outro tamanho. Os inteiros são os *únicos* tipos de Move que suportam a conversão.

As conversões não truncam. A conversão abortará se o resultado for muito grande para o tipo especificado.

|Sintaxe|Operação|Aborta se...|
|---|---|---|
|`(e as T)`| Converte a expressão inteira `e` em um inteiro de tipo `T`| `e` é muito grande para ser representado como `T`|

### Bool

`bool` é o tipo primitivo de Move para valores booleanos verdadeiro e falso. Os literais para bool são `true` ou `false`. `bool` suporta três operações lógicas:

|Sintaxe|Descrição|Expressão equivalente|
|---|---|---|
|`&&`|Comparação lógica **and**.|`p && q` é equivalente a `if (p) q else false`|
|`\|\|`|Comparação lógica **or**.|`p \|\| q` é equivalente a `if (p) true else q`|
|`!`|Negação lógica|`!p` é equivalente a `(p) false else true`|

## Lendo os recursos do tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/tipos_primitivos.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

## Desafio

* Declare 1 valor inteiro **constante** com qualquer valor que você queira.
* Declare 1 variável inteira com qualquer valor que você queira.
* Imprima ambos os números.
* Declare uma variável que compare se esses números são iguais.
* Declare uma variável que compare se o 1º número é maior que o segundo.
* Declare uma variável que compare if as 2 comparações anteriores são verdadeiras.
* Imprima o resultado desta última variável.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer o `push` para o seu repositório do **Github**.
