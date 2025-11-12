module desafio_idade::idade {
    use std::debug::print;
    use std::string::utf8;

    // Constante de erro para menor de idade
    const EMENOR_DE_IDADE: u64 = 1;

    fun pratica_if_else() {
        let idade: u8 = 20; // Mude para um valor menor que 18 para testar o erro

        if (idade >= 18) {
            print(&utf8(b"Voce pode acessar o conteudo!"));
        } else {
            abort EMENOR_DE_IDADE
        }
    }

    fun pratica_assert() {
        let idade: u8 = 20; // Mude para um valor menor que 18 para testar o erro
        
        assert!(idade >= 18, EMENOR_DE_IDADE);
        print(&utf8(b"Acesso permitido via assert!"));
    }

    #[test]
    fun teste_if_else() {
        pratica_if_else();
    }

    #[test]
    fun teste_assert() {
        pratica_assert();
    }

    #[test]
    #[expected_failure(abort_code = 1)]
    fun teste_menor_idade_if() {
        let idade: u8 = 15;
        if (idade >= 18) {
            print(&utf8(b"Acesso permitido"));
        } else {
            abort EMENOR_DE_IDADE
        }
    }

    #[test]
    #[expected_failure(abort_code = 1)]
    fun teste_menor_idade_assert() {
        let idade: u8 = 15;
        assert!(idade >= 18, EMENOR_DE_IDADE);
    }
}
