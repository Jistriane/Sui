module desafio_matriz::matriz {
    use std::debug::print;

    fun pratica() {
        // Criar uma matriz 3x3 usando um vetor de vetores
        let matriz = vector[
            vector[1u8, 2u8, 3u8],
            vector[4u8, 5u8, 6u8],
            vector[7u8, 8u8, 9u8]
        ];

        // Imprimir cada elemento da matriz
        let mut i = 0;
        while (i < vector::length(&matriz)) {
            let linha = vector::borrow(&matriz, i);
            let mut j = 0;
            while (j < vector::length(linha)) {
                let elemento = vector::borrow(linha, j);
                print(elemento);
                j = j + 1;
            };
            i = i + 1;
        };
    }

    #[test]
    fun teste() {
        pratica();
    }
}
