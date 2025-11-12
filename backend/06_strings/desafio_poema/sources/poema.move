module desafio_poema::poema {
    use std::debug::print;
    use std::string::{Self, String};

    fun pratica() {
        // Método 1: Poema em uma única variável usando escape \n
        let poema_unico: String = string::utf8(
            b"Vi um ponto flutuante ante meus olhos,\na imagem de teus olhos se quedou,\ncomo a mancha escura orlada em fogo\nque flutua e cega quando se olha o sol."
        );
        
        print(&poema_unico);

        // Método 2: Criar 4 variáveis e concatená-las
        let mut linha1: String = string::utf8(b"Vi um ponto flutuante ante meus olhos,");
        let linha2: String = string::utf8(b"\na imagem de teus olhos se quedou,");
        let linha3: String = string::utf8(b"\ncomo a mancha escura orlada em fogo");
        let linha4: String = string::utf8(b"\nque flutua e cega quando se olha o sol.");
        
        // Concatenar as linhas
        string::append(&mut linha1, linha2);
        string::append(&mut linha1, linha3);
        string::append(&mut linha1, linha4);
        
        print(&linha1);
    }

    #[test]
    fun teste() {
        pratica();
    }
}

/* Resposta: Qual método é melhor?

O método 1 (uma única variável) é melhor porque:
1. É mais eficiente em termos de memória - cria apenas uma alocação
2. É mais simples e legível
3. Não requer operações de concatenação em tempo de execução
4. Menor overhead de gas na blockchain

O método 2 (4 variáveis concatenadas) pode ser útil quando:
1. As linhas vêm de fontes diferentes
2. Precisamos manipular partes individuais antes de juntar
3. Construímos strings dinamicamente
*/
