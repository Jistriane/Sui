module desafio_comparacao::comparacao {
    use std::debug::print;

    // Constante inteira
    const NUMERO_CONSTANTE: u64 = 100;

    fun pratica() {
        // Variável inteira
        let numero_variavel: u64 = 50;

        // Imprimir ambos os números
        print(&NUMERO_CONSTANTE);
        print(&numero_variavel);

        // Comparar se os números são iguais
        let sao_iguais = NUMERO_CONSTANTE == numero_variavel;
        
        // Comparar se o primeiro número é maior que o segundo
        let primeiro_maior = NUMERO_CONSTANTE > numero_variavel;
        
        // Comparar se ambas as comparações anteriores são verdadeiras
        let ambas_verdadeiras = sao_iguais && primeiro_maior;
        
        // Imprimir o resultado
        print(&ambas_verdadeiras);
    }

    #[test]
    fun teste() {
        pratica();
    }
}
