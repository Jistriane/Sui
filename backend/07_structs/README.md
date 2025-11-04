# Structs

Os tipos definidos pelo usuário podem ser adaptados às necessidades específicas da aplicação. Não apenas no nível de dados, mas também em seu comportamento. Nesta seção, apresentamos a definição de `struct` e como usá-la.

Um `struct` é uma estrutura de dados definida pelo usuário que contém campos tipados. Os `struct`s podem armazenar qualquer tipo não referenciado, incluindo outros structs.

## Executando o tutorial

> :information_source: Lembre-se de que você deve navegar no seu terminal para este diretório:
>```sh
>cd backend/07_structs
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
BUILDING Structs
Running Move unit tests
[debug] 0x5a6f6e612054726573::structs::Autor {
  nome: "Paulo Coelho"
}
[debug] 0x5a6f6e612054726573::structs::Livro {
  titulo: "O Alquimista",
  autor: 0x5a6f6e612054726573::structs::Autor {
    nome: "Paulo Coelho"
  },
  publicado: 1988,
  tem_audiolivro: true,
  edicao: 0x1::option::Option<u16> {
    vec: [ 1 ]
  }
}
[debug] "O Alquimista"
[debug] "Paulo Coelho"
[debug] 1988
[debug] true
[debug] "J. K. Rowling"
[debug] "John Green"
[debug] "Octavio Paz"
[debug] "Carlos Fuentes"
[debug] "Edgar Allan Poe"
[debug] "George Orwell"
[debug] "Charles Dickens"
[debug] 0x5a6f6e612054726573::structs::Autor {
  nome: "Charles Dickens"
}
[ PASS    ] suiz3::structs::teste
Test result: OK. Total tests: 1; passed: 1; failed: 0
```

## Tutorial

Você pode encontrar a documentação para este tutorial dentro do arquivo `sources/structs.move`. Cada uma das declarações tem um comentário para ajudá-lo a entender cada um dos tópicos abordados.

> :information_source: Lembre-se de que você pode encontrar mais informações sobre os `struct`s e seus métodos na [documentação](https://move-language.github.io/move/structs-and-resources.html) oficial da linguagem Move.

## Desafio

* Crie um `struct` de uma Pessoa com os campos que desejar. Pelo menos 3.
    * Por exemplo: `nome`,`idade`.
* Crie um `struct` de uma Turma (uma turma de uma escola) com os campos que desejar.
    * Por exemplo: `materia`, `horario`.
    * Deve incluir o `struct` Pessoa em algum dos campos. Por exemplo, em um campo chamado Professor.
* Crie um `struct` de uma Escola com os campos que desejar.
    * Por exemplo `nome`, `endereco`.
    * Deve incluir um `vector` de Turmas.
* Use esses `struct`s de forma que você tenha uma Escola com um `vector` de Turmas, que inclua pelo menos 2 turmas de 2 professores diferentes.
* Imprima a variável que você criar da Escola no console usando `debug_string`. Ela deve imprimir todos os campos.

> :information_source: Lembre-se de salvar suas alterações no arquivo para posteriormente fazer o `push` para o seu repositório do **Github**.
