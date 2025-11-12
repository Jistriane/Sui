module projeto_completo::biblioteca {
    // Tutorial 01: Variáveis e Constantes
    use std::string::{Self, String};
    use std::debug;
    use sui::event;

    // Constantes
    const LIMITE_EMPRESTIMO: u8 = 3;
    const EERRO_LIMITE_EXCEDIDO: u64 = 1;
    const EERRO_LIVRO_NAO_DISPONIVEL: u64 = 2;
    const EERRO_NAO_AUTORIZADO: u64 = 3;

    // Tutorial 07: Structs com Tutorial 08: Habilidades
    
    // Struct com key e store - pode ser um objeto na blockchain
    public struct Livro has key, store {
        id: UID,
        titulo: String,
        autor: String,
        ano: u16,
        disponivel: bool,
    }

    // Struct apenas com store - pode ser armazenado em outros objetos
    public struct Emprestimo has store, drop {
        livro_id: ID,
        usuario: address,
        data_emprestimo: u64,
    }

    // Struct principal com key
    public struct Biblioteca has key {
        id: UID,
        nome: String,
        livros: vector<Livro>,
        emprestimos: vector<Emprestimo>,
        administrador: address,
    }

    // Tutorial 09: Address - Eventos
    public struct LivroAdicionado has copy, drop {
        livro_id: ID,
        titulo: String,
    }

    public struct LivroEmprestado has copy, drop {
        livro_id: ID,
        usuario: address,
    }

    // Tutorial 10: Funções - Entry functions
    
    // Criar biblioteca
    public entry fun criar_biblioteca(
        nome: String,
        ctx: &mut TxContext
    ) {
        let biblioteca = Biblioteca {
            id: object::new(ctx),
            nome,
            livros: vector::empty<Livro>(),
            emprestimos: vector::empty<Emprestimo>(),
            administrador: tx_context::sender(ctx),
        };
        transfer::share_object(biblioteca);
    }

    // Tutorial 04: Condicionais - Adicionar livro (apenas admin)
    public entry fun adicionar_livro(
        biblioteca: &mut Biblioteca,
        titulo: String,
        autor: String,
        ano: u16,
        ctx: &mut TxContext
    ) {
        // Tutorial 02: Referências - usar &mut para modificar
        let remetente = tx_context::sender(ctx);
        
        // Tutorial 04: Assert para validação
        assert!(remetente == biblioteca.administrador, EERRO_NAO_AUTORIZADO);

        let livro = Livro {
            id: object::new(ctx),
            titulo: titulo,
            autor,
            ano,
            disponivel: true,
        };

        let livro_id = object::uid_to_inner(&livro.id);

        event::emit(LivroAdicionado {
            livro_id,
            titulo: livro.titulo,
        });

        // Tutorial 05: Vetores - adicionar ao vetor
        vector::push_back(&mut biblioteca.livros, livro);
    }

    // Tutorial 03: Tipos primitivos - Buscar livros por ano
    public fun buscar_por_ano(
        biblioteca: &Biblioteca,
        ano: u16
    ): vector<String> {
        let mut resultados = vector::empty<String>();
        let mut i = 0;
        
        while (i < vector::length(&biblioteca.livros)) {
            let livro = vector::borrow(&biblioteca.livros, i);
            
            // Tutorial 03: Comparação de tipos primitivos
            if (livro.ano == ano) {
                vector::push_back(&mut resultados, livro.titulo);
            };
            i = i + 1;
        };
        
        resultados
    }

    // Emprestar livro
    public entry fun emprestar_livro(
        biblioteca: &mut Biblioteca,
        indice_livro: u64,
        ctx: &TxContext
    ) {
        let usuario = tx_context::sender(ctx);
        
        // Tutorial 04: Condicionais - validar limite
        let mut emprestimos_usuario = 0;
        let mut i = 0;
        while (i < vector::length(&biblioteca.emprestimos)) {
            let emprestimo = vector::borrow(&biblioteca.emprestimos, i);
            if (emprestimo.usuario == usuario) {
                emprestimos_usuario = emprestimos_usuario + 1;
            };
            i = i + 1;
        };

        // Tutorial 03: Comparação com constante
        assert!(emprestimos_usuario < LIMITE_EMPRESTIMO, EERRO_LIMITE_EXCEDIDO);

        // Tutorial 02: Referência mutável para modificar
        let livro = vector::borrow_mut(&mut biblioteca.livros, indice_livro);
        assert!(livro.disponivel, EERRO_LIVRO_NAO_DISPONIVEL);

        livro.disponivel = false;

        let emprestimo = Emprestimo {
            livro_id: object::uid_to_inner(&livro.id),
            usuario,
            data_emprestimo: 0, // Simplificado
        };

        event::emit(LivroEmprestado {
            livro_id: emprestimo.livro_id,
            usuario,
        });

        vector::push_back(&mut biblioteca.emprestimos, emprestimo);
    }

    // Tutorial 06: Strings - Obter informações formatadas
    public fun obter_info_livro(biblioteca: &Biblioteca, indice: u64): String {
        let livro = vector::borrow(&biblioteca.livros, indice);
        
        // Concatenar strings para criar informação formatada
        let mut info = string::utf8(b"Titulo: ");
        string::append(&mut info, livro.titulo);
        string::append(&mut info, string::utf8(b", Autor: "));
        string::append(&mut info, livro.autor);
        
        info
    }

    // Função para obter total de livros
    public fun total_livros(biblioteca: &Biblioteca): u64 {
        vector::length(&biblioteca.livros)
    }

    // Função para verificar se livro está disponível
    public fun livro_disponivel(biblioteca: &Biblioteca, indice: u64): bool {
        let livro = vector::borrow(&biblioteca.livros, indice);
        livro.disponivel
    }

    #[test_only]
    use sui::test_scenario;

    #[test]
    fun teste_completo() {
        let admin = @0xAD;
        let usuario = @0xABC;
        let mut scenario = test_scenario::begin(admin);
        
        // Criar biblioteca
        {
            criar_biblioteca(
                string::utf8(b"Biblioteca Municipal"),
                test_scenario::ctx(&mut scenario)
            );
        };
        
        // Adicionar livro
        test_scenario::next_tx(&mut scenario, admin);
        {
            let mut biblioteca = test_scenario::take_shared<Biblioteca>(&scenario);
            
            adicionar_livro(
                &mut biblioteca,
                string::utf8(b"Move Programming"),
                string::utf8(b"Sui Foundation"),
                2024,
                test_scenario::ctx(&mut scenario)
            );
            
            assert!(total_livros(&biblioteca) == 1, 0);
            assert!(livro_disponivel(&biblioteca, 0), 1);
            
            test_scenario::return_shared(biblioteca);
        };
        
        // Emprestar livro
        test_scenario::next_tx(&mut scenario, usuario);
        {
            let mut biblioteca = test_scenario::take_shared<Biblioteca>(&scenario);
            
            emprestar_livro(
                &mut biblioteca,
                0,
                test_scenario::ctx(&mut scenario)
            );
            
            assert!(!livro_disponivel(&biblioteca, 0), 2);
            
            test_scenario::return_shared(biblioteca);
        };
        
        test_scenario::end(scenario);
    }

    #[test]
    fun teste_buscar_por_ano() {
        let admin = @0xAD;
        let mut scenario = test_scenario::begin(admin);
        
        {
            criar_biblioteca(
                string::utf8(b"Biblioteca Tech"),
                test_scenario::ctx(&mut scenario)
            );
        };
        
        test_scenario::next_tx(&mut scenario, admin);
        {
            let mut biblioteca = test_scenario::take_shared<Biblioteca>(&scenario);
            
            adicionar_livro(
                &mut biblioteca,
                string::utf8(b"Livro 2024"),
                string::utf8(b"Autor A"),
                2024,
                test_scenario::ctx(&mut scenario)
            );
            
            adicionar_livro(
                &mut biblioteca,
                string::utf8(b"Livro 2023"),
                string::utf8(b"Autor B"),
                2023,
                test_scenario::ctx(&mut scenario)
            );
            
            let resultados = buscar_por_ano(&biblioteca, 2024);
            assert!(vector::length(&resultados) == 1, 0);
            
            test_scenario::return_shared(biblioteca);
        };
        
        test_scenario::end(scenario);
    }
}
