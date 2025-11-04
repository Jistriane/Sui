module suiz3::habilidades {
    use sui::object::{UID, new, delete};
    use sui::tx_context::TxContext;

    // drop
    struct Ignorame has drop { a: u8 }
    struct SemDrop { a: u8}

    fun pratica_drop() {
        let sem_drop = SemDrop { a: 1 };
        let _ = Ignorame { a: 1 }; // Podemos descartar este valor diretamente. Aqui o estamos ignorando na declaração.

        let _valor_sem_uso = Ignorame { a: 1 }; // Ou podemos declará-lo e simplesmente não usá-lo. Deixamos o _ apenas para evitar que o compilador envie warnings.
    
        let SemDrop { a: _ } = sem_drop; // Este valor precisamos pelo menos desestruturá-lo para que o compilador o considere como usado.
    }

    // copy
    struct Copiavel has copy {}

    fun pratica_copy() {
        let a = Copiavel {}; // Instanciamos a estrutura copiável
        let b = a; // `a` é copiado para `b`
        let c = *&b; // cópia explícita usando desreferenciação

        // Se parássemos aqui, daria erro, já que as variáveis acima não têm `drop`
        // Portanto, precisamos usá-las, neste caso com desestruturação:
        let Copiavel {} = a;
        let Copiavel {} = b;
        let Copiavel {} = c;
    }

    // copy & drop
    struct Valor has copy, drop {}

    fun pratica_copy_drop() {
        let _a = Valor {}; // Podemos parar aqui sem fazer uso desta variável, já que ela tem a habilidade `drop`.
        let b = 1; // Lembre-se que alguns tipos primitivos também têm essas habilidades.
        let _c = &b; // E também as referências, desde que seu valor referenciado também as tenha.
    }

    // key
    struct Objeto has key { id: UID } // Objetos com a habilidade key exigem que seu primeiro campo seja um id

    fun pratica_key(ctx: &mut TxContext) { // Para inicializar um UID (unique ID) precisamos do contexto da transação, este conceito veremos a fundo mais adiante
        let objeto = Objeto { id: new(ctx) }; // Os UIDs sempre são inicializados com esta expressão, usando o contexto da transação que passamos para a função
        let Objeto { id } = objeto; // Como UID NÃO tem drop, precisamos consumi-lo, mas só podemos consumi-lo se for desempacotado de um objeto, como aqui
        delete(id); // Uma vez desempacotado, podemos excluí-lo usando delete, uma função que importamos da biblioteca sui::object
    }

    // key & store
    struct Armazenavel has store {}
    struct Container has key, store {
        id: UID, // Lembre-se que qualquer struct com a habilidade key precisa de seu UID
        armazena: Armazenavel,
    }

    fun pratica_key_store(ctx: &mut TxContext) {
        let armazenavel = Armazenavel {}; // Estrutura com a habilidade `store`
        let container = Container { // E a guardamos.
            id: new(ctx),
            armazena: armazenavel, // Para podermos guardá-la aqui, precisamos que a variável acima tenha `store`.
        }; // Esta estrutura podemos armazenar e usar como chave ao mesmo tempo. Mas como?? Onde??

        let Container { armazena, id } = container;
        let Armazenavel {} = armazena; // Não têm `drop`, então temos que consumi-las.
        delete(id); // Lembre-se que os UIDs são consumidos usando object::delete.
        // Claro que isso seria resolvido adicionando `drop`, mas é útil saber a sintaxe de desestruturação.
        
        // key e store farão mais sentido nas próximas lições. Por enquanto, analise as sintaxes e entenda quais são as habilidades que existem em Move.
    }

    #[test_only]
    use sui::tx_context; // Por enquanto, como não estamos trabalhando com a blockchain e apenas compilando localmente, vamos simular uma transação para os testes

    #[test]
    fun teste() {
        let ctx = &mut tx_context::dummy();

        pratica_drop();
        pratica_copy();
        pratica_copy_drop();
        pratica_key(ctx); // Aqui passamos a simulação da transação que criamos há pouco
        pratica_key_store(ctx);
    }
}