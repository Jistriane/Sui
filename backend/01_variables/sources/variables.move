module suiz3::variables {
    use std::debug::print;
    use std::string::utf8;
    use std::vector;
    
    // As constantes só podem ser usadas no módulo onde foram declaradas.
    // A primeira letra de uma constante sempre tem que ser uma letra maiúscula de A a Z.
    // Depois da primeira letra, pode conter: letras de a a z, ou de A a Z, assim como dígitos de 0 a 9, ou sublinhado _.
    // O código em Move não aceita acentos em nenhum lugar, nem mesmo em comentários.
    const SAUDACAO: vector<u8> = b"Olá, Mundo!";
    const VALOR_VERDADEIRO: bool = true;

    fun pratica() {
        // Fazendo uso de constantes:
        print(&utf8(SAUDACAO)); // Resultado: [debug] "Olá, Mundo!"
        let copia_valor_verdadeiro = VALOR_VERDADEIRO; // Cópia do valor verdadeiro para evitar o warning por ownership.
        print(&copia_valor_verdadeiro); // Resultado: [debug] true

        // Declarando variáveis:
        let a = 1; // As variáveis em Move são declaradas com let
        let b = a + a;
        print(&a); // Resultado: [debug] 1
        print(&b); // Resultado: [debug] 2

        //Nomeando variáveis:
        // As variáveis podem ter: letras de a a z, ou de A a Z, assim como dígitos de 0 a 9, ou sublinhado _.
        // Podem começar com letras de a a z ou com sublinhado.
        // Seu nome não pode começar com uma letra maiúscula (A - Z).
        let _c = 3; // Geralmente usamos _ no início do nome para indicar que é uma variável que não será usada.
        let uma_variavel_com_um_nome_muito_longo = b"Sui";
        let _camelCase = false;
        print(&utf8(uma_variavel_com_um_nome_muito_longo)); // Resultado: [debug] "Sui"

        // Anotações de tipo:
        // Você pode especificar o tipo de uma variável antes de declará-la
        let _d: address = @0x0;
        // No entanto, isso nem sempre é necessário.
        // Só deve ser feito quando o compilador não pode inferir o tipo por si só.
        // Por exemplo: let v1 = vector::empty(); dará erro porque o sistema não sabe o tipo resultante da função vector::empty().
        let _v2: vector<u64> = vector::empty();

        // Declaração múltipla:
        let (x0, x1) = (0, 1); // Você pode declarar múltiplas variáveis ao mesmo tempo.
        print(&x0); // Resultado: [debug] 0
        print(&x1); // Resultado: [debug] 1

        // Reatribuição
        let _e = 0;
        _e = 100;
        print(&_e);

        // Escopo
        let f = 5; // Variáveis declaradas fora de um escopo podem ser usadas dentro dos escopos declarados no mesmo nível da variável.
        { // Abrindo um novo escopo
            let g = f + f;
            print(&g); // Resultado: [debug] 10
        }; // Fechando o escopo
        // print(&g); aqui daria erro, pois foi declarada em outro escopo, e uma vez fechado, não temos mais acesso a essa variável.
        // No entanto, como não estamos mais nesse escopo, podemos redeclará-la e usá-la:
        let g = f + f + f;
        print(&g); // Resultado: [debug] 15

        // Shadowing (Sombreamento)
        // Se uma variável é redeclarada, a declaração anterior é ignorada.
        let _h = 1;
        let _h = false; // Na verdade, você pode mudar o tipo de uma variável declarada anteriormente.
        print(&_h); // Resultado: [debug] false
    }

    #[test]
    fun teste() {
        pratica();
    }
}