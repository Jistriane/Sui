module suiz3::condicionais {
    use std::debug::print;
    use std::string::utf8;

    const ESemAcesso: u64 = 1; // Geralmente, as constantes para indicar um erro começam com E maiúsculo, seguido pelo motivo do erro.
    const NAO_HA_ACESSO: u64 = 2; // Embora não seja necessário, seja descritivo em seus erros.

    fun pratica() {
        // If
        let a = 10;
        if (a > 0) { // A avaliação da condição dentro do if tem que resultar em um booleano.
            print(&utf8(b"a e maior que 0")); // A operação após a avaliação pode ser quase qualquer coisa.
        }; // Fechamos o bloco.
        // Resultado: [debug] "a e maior que 0"

        // Else
        if (a > 20) {
            print(&utf8(b"a e maior que 20"));
        } else { // Não fechamos o bloco.
            print(&utf8(b"a nao e maior que 20"));
        }; // Até aqui se fecha.
        // Resultado: [debug] "a nao e maior que 20"

        // Se a expressão resultar em um valor, é possível armazená-la em uma variável
        let armazenada = if (a < 100) a else 100;
        print(&armazenada); // Resultado: [debug] 10

        // Abort
        let acesso_usuario: bool = true; // Neste cenário, nosso usuário tem acesso a todas as funções.
        // Normalmente, você teria que avaliar isso dependendo do seu módulo.
        if(!acesso_usuario) { // Tente remover a negação e execute novamente.
            abort(1) // O código é retornado ao usuário se a execução abortar.
        } else {
            print(&utf8(b"Usuario tem acesso."));
        };

        // Assert
        assert!(acesso_usuario, 1); // Outra forma de escrever a expressão anterior sem a necessidade de retornar algo.
        // Tente negar o acesso usando !

        // Códigos de erro
        assert!(acesso_usuario, ESemAcesso); // É uma boa prática especificar o motivo de um abort/assert.
        assert!(acesso_usuario, NAO_HA_ACESSO);
    }

    #[test]
    fun teste() {
        pratica();
    }
}