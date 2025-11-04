address suiz3 { // Agora usamos uma nova sintaxe, já que teremos diferentes módulos dentro do mesmo endereço.
    module funcoes1 {
        use std::debug::print;
        use std::string::utf8;

        fun retorno(): u64 { // As funções podem retornar algo, até agora a maioria das funções que usamos não retornava nada.
            let a = 0u64;
            a // Para retornar algo, precisa ser a última linha na expressão. Omitimos o ;
            // Isso é um retorno implícito
        }

        fun retorno_condicional(a: u64): bool { // As funções podem incluir no nome: a a z, A a Z, _, dígitos de 0 a 9.
            // O nome de uma função não pode ter _ no início, mas pode depois do primeiro caractere.
            if (a > 0) {
                true
            } else {
                false
            } // Normalmente fecharíamos aqui, mas como o resultado do if será retornado, não fechamos
        }

        public fun funcao_publica() { // Podemos declarar funções públicas para serem chamadas de outros módulos
            print(&utf8(b"Ola de funcoes1!"));
        }

        #[test]
        fun teste() {
            retorno();
            let a = retorno_condicional(0); // É importante notar que se vamos retornar algo, precisa ser consumido. A menos que tenha a habilidade drop
            print(&a); // Resultado: [debug] false
        }
    }

    module funcoes2 { // Novo módulo!
        use suiz3::funcoes1::{Self, funcao_publica}; // Usaremos este import para demonstrar as diferentes maneiras de importar um módulo.

        fun chamada_externa() {
            // Podemos fazer chamadas a funções públicas:
            suiz3::funcoes1::funcao_publica(); // Esta forma de chamá-la é quando não importamos a função com use
            funcoes1::funcao_publica(); // Esta forma é quando importamos Self
            funcao_publica(); // E por último, esta é quando importamos a função diretamente.
            // As 3 chamadas são equivalentes, qual utilizar depende do seu caso de uso.
        }

        #[test]
        fun teste() {
            chamada_externa(); // Resultado: [debug] "Ola de funcoes1!"
        }
    }

    module funcoes3 {
        use std::debug::print;

        fun parametros(a: u64, b: u64) { // As funções podem receber parâmetros, cada um separado por uma vírgula e especificando o tipo esperado.
            print(&a); // Resultado: [debug] 1
            print(&b); // Resultado: [debug] 2
        }

        fun retorno_multiplo(): (vector<u8>, u64) { // As funções podem ter múltiplos retornos. É necessário envolvê-los em parênteses.
            (b"Sui", 0) // O mesmo ao retorná-los
        }

        fun retorno_explicito(): u8 { // Como vimos acima, podemos omitir a palavra return se nosso código avaliar para um valor final
            return 100 // Mesmo assim, também podemos usar return se for necessário. Note que também se omite ;
        }

        #[test_only] // Podemos importar módulos que serão usados apenas nos testes com test_only
        use std::string::utf8; // Por exemplo, este import só usaremos abaixo para imprimir o valor recebido, mas acima não precisamos dele.

        #[test]
        fun teste() {
            let a = 1u64; // Os parâmetros têm que ser do tipo esperado pela função.
            parametros(a, 2); // Ao enviar parâmetros, lembre-se de separá-los com ,

            let (nome, numero) = retorno_multiplo(); // Ao receber uma função com retorno múltiplo, atribuímos novas variáveis para guardar cada valor.
            print(&utf8(nome)); // Resultado: [debug] "Sui"
            print(&numero); // Resultado: [debug] 0

            let retorno_explicito = retorno_explicito(); // Eu mencionei que as funções e variáveis podem ter o mesmo nome?
            print(&retorno_explicito); // Resultado: [debug] 100
        }
    }

    module funcoes4 {
        public entry fun funcao_entry() { // O modificador entry é essencialmente o que seria o modificador main em outras linguagens
            suiz3::funcoes1::funcao_publica(); // São funções que permitem que sejam chamadas de maneira segura e invocadas diretamente.

            // Não é um modificador restritivo. Estas funções podem continuar sendo chamadas por outras funções dentro do módulo.
            // As funções entry são as funções que poderemos chamar do terminal no momento de subir o código para a blockchain.
            // As funções entry NÃO podem retornar um valor.
        }

        #[ext(view)] // Por último, podemos ter funções de leitura, elas são atribuídas com #[ext(view)].
        public fun funcao_leitura(): u16 { // Estas funções também podem ser chamadas do terminal.
            200 // As funções view devem retornar um valor
            // Dentro deste contexto não fazem muito sentido, mas as abordaremos na próxima lição.
        }

        #[test_only]
        use std::debug::print;

        #[test]
        fun teste() {
            funcao_entry(); // Resultado: [debug] "Ola de funcoes1!"
            let a = funcao_leitura();
            print(&a); // Resultado: [debug] 200
        }

        // Lembre-se que você pode ver mais informações sobre as funções e suas declarações na documentação oficial da linguagem Move:
        // https://move-book.com/move-basics/function
    }
}