module suiz3::strings {
    use std::debug::print;
    use std::string::{utf8, is_empty, append, append_utf8, insert};

    fun pratica() {
        // Strings
        
        // Bytes
        let string_bytes = b"Hello World!";
        print(&string_bytes); // Resultado: [debug] 0x48656c6c6f20576f726c6421
        print(&utf8(string_bytes)); // Resultado: [debug] "Hello World!"
        
        // Hex
        let string_hexadecimal = x"48656C6C6F20576F726C6421";
        print(&string_hexadecimal); // Resultado: [debug] 0x48656c6c6f20576f726c6421 Nota alguma semelhança?
        print(&utf8(string_hexadecimal)); // Resultado: [debug] "Hello World!"

        // Operações
        let string_vazia = b"";
        let validacao = is_empty(&utf8(string_vazia)); // Validando se a string está vazia
        print(&validacao); // Resultado: [debug] true

        let string_utf8 = utf8(string_vazia);
        append_utf8(&mut string_utf8, b"Ola"); // Concatenando 2 strings utf8. Note que passamos uma referência mutável.
        print(&string_utf8); // Resultado: [debug] "Ola"

        let outra_string = utf8(b"Adeus");
        append(&mut string_utf8, outra_string); // Concatenando 2 strings.
        print(&string_utf8); // Resultado: [debug] "OlaAdeus"

        let hex_para_utf8 = utf8(string_hexadecimal);
        append(&mut string_utf8, hex_para_utf8); // Lembre-se que você pode usar tanto bytes quanto hex.
        print(&string_utf8); // Resultado: [debug] "OlaAdeusHello World!"

        let intruso = utf8(b"INSERIR-ME");
        insert(&mut string_utf8, 3, intruso); // Inserindo uma string.
        print(&string_utf8); // Resultado: [debug] "OlaINSERIR-MEAdeusHello World!"

        let escape = utf8(b"\nIsto sera impresso em uma nova linha.");
        append(&mut string_utf8, escape);
        print(&string_utf8); // Resultado: [debug] "OlaINSERIR-MEAdeusHello World!
                            //            Isto sera impresso em uma nova linha."
    }

    #[test]
    fun teste() {
        pratica();
    }
}