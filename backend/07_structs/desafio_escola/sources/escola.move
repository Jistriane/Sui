module desafio_escola::escola {
    use std::string::{Self, String};
    use std::debug;

    // Struct Pessoa com 3 campos
    public struct Pessoa has copy, drop {
        nome: String,
        idade: u8,
        cpf: String,
    }

    // Struct Turma com campos incluindo Pessoa (Professor)
    public struct Turma has copy, drop {
        materia: String,
        horario: String,
        professor: Pessoa,
        sala: u16,
    }

    // Struct Escola com campos incluindo vetor de Turmas
    public struct Escola has copy, drop {
        nome: String,
        endereco: String,
        turmas: vector<Turma>,
        capacidade_alunos: u32,
    }

    fun pratica() {
        // Criar professores
        let professor1 = Pessoa {
            nome: string::utf8(b"Maria Silva"),
            idade: 35,
            cpf: string::utf8(b"123.456.789-00"),
        };

        let professor2 = Pessoa {
            nome: string::utf8(b"Joao Santos"),
            idade: 42,
            cpf: string::utf8(b"987.654.321-00"),
        };

        // Criar turmas com professores diferentes
        let turma1 = Turma {
            materia: string::utf8(b"Matematica"),
            horario: string::utf8(b"08:00 - 10:00"),
            professor: professor1,
            sala: 101,
        };

        let turma2 = Turma {
            materia: string::utf8(b"Historia"),
            horario: string::utf8(b"10:00 - 12:00"),
            professor: professor2,
            sala: 202,
        };

        // Criar vetor de turmas
        let turmas = vector[turma1, turma2];

        // Criar escola com vetor de turmas
        let escola = Escola {
            nome: string::utf8(b"Escola Estadual Sui"),
            endereco: string::utf8(b"Rua da Blockchain, 123"),
            turmas,
            capacidade_alunos: 500,
        };

        // Imprimir usando debug_string
        debug::print(&escola);
    }

    #[test]
    fun teste() {
        pratica();
    }
}
