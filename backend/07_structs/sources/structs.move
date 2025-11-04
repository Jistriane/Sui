module suiz3::structs {
    use std::debug::print;
    use std::string::{String,utf8};
    use std::option::{Option, some};

    // Faça uma anotação mental de `has drop`. Veremos isso mais adiante. Por enquanto, não é necessário que você entenda.
    struct Autor has drop { // Declaramos um struct. É um tipo personalizado que podemos usar no resto do nosso código.
        nome: String, // Este tipo tem apenas um campo.
    }

    struct Livro { // Agora criamos um tipo com mais campos.
        titulo: String,
        autor: Autor, // Note que usamos o tipo que declaramos acima.
        publicado: u16,
        tem_audiolivro: bool,
        edicao: Option<u16>, // O que é isso?
    } // Note que não fechamos com ;

    fun pratica() {
        
        let autor = Autor { nome: utf8(b"Paulo Coelho") };
        print(&autor); // Note que usamos debug_string da lição anterior para imprimir o struct completo.
        // Resultado:
        // [debug] "0x5a6f6e612054726573::structs::Autor {
        //   nome: \"Paulo Coelho\"
        // }"

        let livro = Livro {
            titulo: utf8(b"O Alquimista"), // Usamos , semelhante a quando declaramos um objeto em outras linguagens.
            autor, // Como a variável que declaramos acima tem o mesmo nome que a propriedade, não é necessário colocar algo como autor: autor,
            publicado: 1988u16, // Lembre-se que podemos especificar o tipo do número literalmente
            tem_audiolivro: true,
            edicao: some(1), // Ou deixar o compilador inferir
        }; // Temos que fechar o bloco aqui.

        print(&livro); // Note a impressão do campo Autor.
        //[debug] "0x5a6f6e612054726573::structs::Livro {
        //  titulo: \"O Alquimista\",
        //  autor: 0x5a6f6e612054726573::structs::Autor {
        //    nome: \"Paulo Coelho\"
        //  },
        //  publicado: 1988,
        //  tem_audiolivro: true,
        //  edicao: Some(1)
        //}"

        // Podemos acessar valores específicos da estrutura.
        print(&livro.titulo); 
        print(&livro.autor.nome);

        // Também podemos desestruturar um struct.
        let Livro { titulo: _, autor: _ , publicado, tem_audiolivro, edicao:_ } = livro; 
        // Basicamente, pegamos um struct e o decompomos em variáveis, para que possam ser usadas depois, por exemplo:
        print(&publicado); // Resultado: [debug] 1988
        print(&tem_audiolivro); // Resultado: [debug] true

        // Note que estamos ignorando certos valores desta forma: titulo: _, para que não sejam criadas variáveis para eles.
        // O que significa que este código falharia: print(&titulo);
        // Pois não criamos uma variável para esse valor, simplesmente o ignoramos.

        let autor = Autor { nome: utf8(b"J. K. Rowling") }; // Shadowing da variável autor.
        let Autor { nome: outro_nome } = autor; // Ao desestruturar, você pode mudar o nome da variável.
        print(&outro_nome); // Resultado: [debug] "J. K. Rowling"

        let Autor { nome } = Autor { nome: utf8(b"John Green") }; // Podemos até mesmo atribuir valores e desestruturá-los ao mesmo tempo:
        print(&nome); // Resultado: [debug] "John Green"

        // Ou criar novas referências:
        let autor = Autor { nome: utf8(b"Octavio Paz") };
        let Autor { nome } = &autor; // Referência imutável
        print(nome); // Agora nome é um tipo referenciado. Resultado: [debug] "Octavio Paz"

        let autor = Autor { nome: utf8(b"Carlos Fuentes") };
        let Autor { nome } = &mut autor; // Criamos uma referência mutável
        print(nome); // Resultado: [debug] "Carlos Fuentes"
        *nome = utf8(b"Edgar Allan Poe"); // Como é mutável, podemos modificar o valor
        print(nome); // Resultado: [debug] "Edgar Allan Poe"

        // Referências
        let autor = Autor { nome: utf8(b"George Orwell") };
        let autor_ref = &autor;

        let leitura = autor_ref.nome; // Podemos ler um valor através da referência.
        print(&leitura); // Resultado: [debug] "George Orwell"

        let modificavel = &mut autor.nome;
        *modificavel = utf8(b"Charles Dickens"); // E podemos modificá-la
        print(modificavel); // Resultado: [debug] "Charles Dickens"
        print(&autor); // Estamos fazendo uma referência ao valor diretamente, portanto:
        // Resultado:
        // [debug] "0x5a6f6e612054726573::structs::Autor {
        //   nome: \"Charles Dickens\"
        // }"

        // Lembre-se que você pode obter informações sobre as demais operações em:
        // https://move-language.github.io/move/structs-and-resources.html
    }

    #[test]
    fun teste() {
        pratica();
    }
}