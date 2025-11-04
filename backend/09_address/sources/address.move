// Desta vez, usaremos o endereço explícito em vez do nomeado.
module 0x5A6F6E612054726573::address {

    use std::debug::print; // Quando importamos usando `use`, na verdade `std` é um endereço nomeado, neste caso, o da biblioteca padrão do Move
    use sui::tx_context::{TxContext, sender}; // E `sui` é o endereço nomeado correspondente à biblioteca da Sui
    use sui::address::{to_string, from_ascii_bytes};

    // Nota: estas funções estão dentro da biblioteca padrão do Move
    fun pratica_address() {
        let a1: address = @0x1; // versão curta de 0x00000000000000000000000000000001
        print(&a1); // Resultado: [debug] @0x1
        let a2: address = @0xBEBE; // versão curta de 0x0000000000000000000000000000BEBE
        print(&a2); // Resultado: [debug] @0xbebe
        let a3: address = @66;
        print(&a3); // Resultado: [debug] @0x42
    }

    // Nota: estas funções estão dentro da biblioteca da Sui
    // Ao chamar alguma função do nosso contrato inteligente, estamos executando uma transação
    // Esta transação é escrita na blockchain e contém informações como a conta de quem a executou
    fun pratica_sender(ctx: &TxContext) { // Podemos acessar esta informação usando o TxContext ou contexto de transação
        // E podemos acessar quem está chamando essa transação usando a função sender.
        print(&sender(ctx)); // Isso imprimirá um address. Resultado: [debug] @0x0

        // Dentro da biblioteca da Sui, temos outras opções para manipular o tipo address
        // Podemos converter endereços para strings
        print(&to_string(sender(ctx))); // Resultado: [debug] "0000000000000000000000000000000000000000000000000000000000000000"

        // Podemos ler um endereço a partir de texto e convertê-lo em address (Deve ter exatamente 64 caracteres)
        print(&from_ascii_bytes(&b"000000000000000000000000000000000000000000000000000000000000BEBE")); // Resultado: [debug] @0xbebe
        
        // Você pode validar outras operações na documentação do framework da Sui
        // https://docs.sui.io/references/framework/sui/address
    }

    #[test_only]
    use sui::tx_context; // Vamos usar esta biblioteca apenas durante o contexto de testes

    #[test]
    fun teste() {
        // Como estamos programando localmente, não existe uma transação, ou seja, não estamos escrevendo na blockchain
        let ctx = &tx_context::dummy(); // Portanto, usamos uma função que simula uma transação nos testes

        practica_address();
        practica_sender(ctx); // E enviamos este contexto para a função que o requer.
    }
}