# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

## [1.0.0] - 2025-11-12

### ✨ Adicionado

#### Projetos Extras
- **TodoList** (`backend/01_variables/todolist/`) - Sistema completo de gerenciamento de tarefas
  - Criar lista de tarefas
  - Adicionar, completar e remover tarefas
  - Emissão de eventos
  - 2 testes unitários

- **Projeto Completo** (`backend/projeto_completo/`) - Sistema de Biblioteca
  - Integração de todos os 10 conceitos dos tutoriais
  - CRUD completo de livros
  - Sistema de empréstimos
  - Busca por ano de publicação
  - 2 testes de integração

#### Desafios
- **Desafio Comparação** (`backend/03_tipos_primitivos/desafio_comparacao/`)
  - Operadores lógicos e comparações
  - Constantes e variáveis
  
- **Desafio Idade** (`backend/04_condicionais/desafio_idade/`)
  - Validação com if/else
  - Validação com assert
  - 4 testes (incluindo casos de erro esperado)
  
- **Desafio Matriz** (`backend/05_vetores/desafio_matriz/`)
  - Matriz 3x3 com vetores aninhados
  - Loops while aninhados
  
- **Desafio Poema** (`backend/06_strings/desafio_poema/`)
  - Concatenação de strings
  - Manipulação de texto
  
- **Desafio Escola** (`backend/07_structs/desafio_escola/`)
  - Structs aninhadas (Pessoa, Turma, Escola)
  - Sistema complexo de dados

#### Configurações
- Configuração completa do Sui Client
  - Wallet ed25519 criado
  - Ambientes devnet e testnet configurados
  - Tokens obtidos em ambas as redes

- Configuração completa do Walrus
  - Instalação via suiup (v1.36.1)
  - Configuração testnet
  - Tokens WAL obtidos
  - Testes de upload/download

#### Documentação
- README.md expandido com seções detalhadas:
  - Estrutura do repositório
  - Status de conclusão
  - Comandos úteis
  - Estatísticas do projeto
  - Informações de deployment
  - Conceitos aprendidos
  - Bugs corrigidos
  - Recursos adicionais
  
- RESULTADOS.md criado com:
  - Tabelas de status completas
  - Detalhes de todos os deployments
  - Estatísticas finais
  - Lista de conquistas
  - Próximos passos sugeridos
  
- CHANGELOG.md criado para rastreamento de mudanças

#### Build Artifacts
- Move.lock gerado para todos os projetos:
  - todolist
  - desafio_comparacao
  - desafio_idade
  - desafio_matriz
  - desafio_poema
  - desafio_escola
  - projeto_completo

### 🐛 Corrigido

- **tipos_primitivos.move** - Variável `negacao` sendo chamada como `negacion`
  - Linha afetada: chamada da função print
  - Impacto: Erro de compilação
  - Status: ✅ Corrigido
  
- **address.move** - Nomes de funções em espanhol
  - Funções afetadas: `practica_address`, `practica_sender`
  - Corrigido para: `pratica_address`, `pratica_sender`
  - Impacto: Inconsistência de nomenclatura
  - Status: ✅ Corrigido

- **desafio_matriz** - Variáveis de loop não declaradas como mut
  - Variáveis afetadas: `i`, `j`
  - Adicionado: palavra-chave `mut`
  - Status: ✅ Corrigido

- **projeto_completo** - Endereço inválido @0xUS
  - Corrigido para: @0xABC
  - Status: ✅ Corrigido

### 🚀 Deployment

#### Blockchain Sui - Devnet
- **Package ID**: `0x765c3918b992228cb0a44a2e289ba01f9db9cf2de03d496db25020e99789f98c`
- **Transaction**: `BUU1kwco9dKpGxVoQJUtjtXDZduRwDv3FbjGjX5qexv4`
- **Gas Used**: ~0.0406 SUI
- **Módulo**: `pratica_sui::introducao`
- **Status**: ✅ Sucesso

#### Walrus - Testnet
- **Blob ID**: `xbhRB460J_8TUYXpnPuuaz3KzatyQpIeQlwTKpGNrhc`
- **Object ID**: `0xddea702026241cb2f2f08a2d8c3dd80dce28826c459b89d3bd3a34c28cd8b4e7`
- **Shared Object**: `0x7a3baf5f84101a4b4b4a3ddca3d8caf71d32bf79167a024db72a6737f07849f8`
- **Size**: 13 B (63 MiB encoded)
- **Cost**: 0.011 WAL
- **Status**: ✅ Sucesso

### 📊 Estatísticas

- **Tutoriais Completados**: 11/11 (100%)
- **Testes Passando**: 23/23 (100%)
- **Desafios Criados**: 5
- **Projetos Extras**: 2
- **Bugs Corrigidos**: 4
- **Linhas de Código**: ~1000+
- **Move.lock Files**: 7

### 🎓 Validações

- ✅ Todos os tutoriais base (00-10) executados
- ✅ Todos os testes unitários passando
- ✅ Todos os desafios resolvidos e testados
- ✅ Projeto completo criado e validado
- ✅ Sui Client configurado
- ✅ Walrus configurado
- ✅ Package publicado na blockchain
- ✅ Blob armazenado no Walrus
- ✅ Documentação completa gerada

---

## [0.1.0] - Data Inicial

### 🎉 Início do Projeto

- Clone do repositório original
- Estrutura base dos tutoriais (00-10)
- READMEs originais em português
- Exemplos base de código Move

---

## Formato

Este changelog segue o formato [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## Tipos de Mudanças

- **Adicionado** - para novas funcionalidades
- **Modificado** - para mudanças em funcionalidades existentes
- **Descontinuado** - para funcionalidades que serão removidas
- **Removido** - para funcionalidades removidas
- **Corrigido** - para correção de bugs
- **Segurança** - em caso de vulnerabilidades
