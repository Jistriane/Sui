# 🚀 Guia Rápido - Sui First Steps

> Referência rápida de comandos e conceitos mais usados

---

## 📋 Comandos Essenciais

### Sui CLI

```bash
# Verificar versão
sui --version

# Informações do cliente
sui client

# Ver ambiente ativo
sui client active-env

# Mudar ambiente
sui client switch --env devnet
sui client switch --env testnet

# Listar ambientes
sui client envs

# Ver endereço ativo
sui client active-address

# Ver todos os endereços
sui client addresses

# Ver saldo
sui client balance

# Ver objetos
sui client objects

# Obter tokens (devnet)
sui client faucet
```

### Move - Desenvolvimento

```bash
# Testar projeto
sui move test

# Build projeto
sui move build

# Publicar pacote
sui client publish --gas-budget 100000000

# Verificar bytecode
sui move verify-bytecode-meter
```

### Walrus

```bash
# Verificar versão
walrus --help

# Obter tokens WAL (testnet)
walrus get-wal

# Upload arquivo
walrus store <arquivo> --epochs <num>

# Status do blob
walrus blob-status --blob-id <ID>

# Download arquivo
walrus read <blob-id> --out <arquivo-saida>

# Compartilhar blob
walrus share --blob-obj-id <object-id>

# Listar blobs
walrus list-blobs
```

### Suiup (Version Manager)

```bash
# Verificar versão
suiup --version

# Instalar ferramenta
suiup install sui
suiup install mvr
suiup install walrus

# Ver instalados
suiup show

# Mudar versão ativa
suiup switch sui@testnet
suiup switch walrus@testnet

# Atualizar
suiup update sui
```

---

## 📁 Estrutura de Projeto Move

```
meu_projeto/
├── Move.toml          # Configuração do projeto
├── Move.lock          # Lock de dependências
├── sources/           # Código fonte
│   └── modulo.move
├── tests/             # Testes (opcional)
│   └── testes.move
└── build/             # Artefatos de build (gerado)
```

### Move.toml Básico

```toml
[package]
name = "MeuProjeto"
edition = "2024.beta"

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }

[addresses]
meu_projeto = "0x0"  # Use 0x0 para publicação
```

---

## 💻 Estrutura de Módulo Move

```move
module meu_projeto::exemplo {
    // Imports
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    // Constantes
    const ERRO_EXEMPLO: u64 = 0;

    // Structs
    public struct MeuObjeto has key, store {
        id: UID,
        valor: u64,
    }

    // Funções
    public entry fun criar(ctx: &mut TxContext) {
        // Implementação
    }

    // Testes
    #[test]
    fun test_exemplo() {
        // Teste
    }
}
```

---

## 🎯 Habilidades (Abilities)

| Habilidade | Descrição | Quando Usar |
|------------|-----------|-------------|
| `copy` | Pode ser copiado | Tipos simples (u64, bool, etc) |
| `drop` | Pode ser descartado | Valores temporários |
| `store` | Pode ser armazenado | Campos de objetos |
| `key` | Pode ter identidade única | Objetos on-chain |

### Exemplos

```move
// Objeto on-chain (possui ID)
struct Livro has key, store {
    id: UID,
    titulo: String,
}

// Struct interno (sem ID)
struct Dados has copy, drop, store {
    valor: u64,
}
```

---

## 🔧 Tipos Primitivos

| Tipo | Descrição | Range |
|------|-----------|-------|
| `bool` | Booleano | true/false |
| `u8` | Inteiro 8-bit | 0 a 255 |
| `u16` | Inteiro 16-bit | 0 a 65,535 |
| `u32` | Inteiro 32-bit | 0 a 4,294,967,295 |
| `u64` | Inteiro 64-bit | 0 a 18,446,744,073,709,551,615 |
| `u128` | Inteiro 128-bit | Muito grande |
| `u256` | Inteiro 256-bit | Extremamente grande |
| `address` | Endereço Sui | 0x... (32 bytes) |

---

## 📝 Padrões Comuns

### Entry Function com Objeto

```move
public entry fun atualizar(
    obj: &mut MeuObjeto,
    novo_valor: u64,
) {
    obj.valor = novo_valor;
}
```

### Criar e Transferir Objeto

```move
use sui::transfer;

public entry fun criar(ctx: &mut TxContext) {
    let obj = MeuObjeto {
        id: object::new(ctx),
        valor: 0,
    };
    transfer::transfer(obj, tx_context::sender(ctx));
}
```

### Deletar Objeto

```move
use sui::object;

public entry fun deletar(obj: MeuObjeto) {
    let MeuObjeto { id, valor: _ } = obj;
    object::delete(id);
}
```

### Emitir Evento

```move
use sui::event;

public struct Evento has copy, drop {
    mensagem: String,
}

public entry fun fazer_algo() {
    event::emit(Evento {
        mensagem: string::utf8(b"Algo aconteceu!")
    });
}
```

### Assert com Mensagem

```move
const ERRO_VALOR_INVALIDO: u64 = 1;

public fun validar(valor: u64) {
    assert!(valor > 0, ERRO_VALOR_INVALIDO);
}
```

---

## 🧪 Testes

### Teste Básico

```move
#[test]
fun test_basico() {
    let x = 10;
    assert!(x == 10, 0);
}
```

### Teste com Contexto

```move
use sui::test_scenario;

#[test]
fun test_com_contexto() {
    let usuario = @0xA;
    let scenario_val = test_scenario::begin(usuario);
    let scenario = &mut scenario_val;
    
    // Seu teste aqui
    
    test_scenario::end(scenario_val);
}
```

### Teste de Erro Esperado

```move
#[test]
#[expected_failure(abort_code = ERRO_EXEMPLO)]
fun test_erro() {
    abort ERRO_EXEMPLO
}
```

---

## 🌐 Ambientes de Rede

| Ambiente | Uso | URL |
|----------|-----|-----|
| **localnet** | Desenvolvimento local | http://127.0.0.1:9000 |
| **devnet** | Testes rápidos | https://fullnode.devnet.sui.io |
| **testnet** | Testes pré-produção | https://fullnode.testnet.sui.io |
| **mainnet** | Produção | https://fullnode.mainnet.sui.io |

---

## 💰 Gas Budget

Valores recomendados para `--gas-budget`:

| Operação | Gas Budget |
|----------|------------|
| Transferência simples | 10000000 (0.01 SUI) |
| Call de função | 50000000 (0.05 SUI) |
| Publicação de pacote | 100000000 (0.1 SUI) |
| Operação complexa | 200000000 (0.2 SUI) |

> 1 SUI = 1,000,000,000 MIST

---

## 🔍 Exploradores

- **Devnet**: https://suiexplorer.com/?network=devnet
- **Testnet**: https://suiexplorer.com/?network=testnet
- **Mainnet**: https://suiexplorer.com/?network=mainnet

---

## 🚰 Faucets

### Devnet
```bash
sui client switch --env devnet
sui client faucet
```

### Testnet
Usar interface web: https://faucet.sui.io/?address=SEU_ENDERECO

---

## ⚡ Atalhos Úteis

### Criar Novo Projeto

```bash
mkdir meu_projeto
cd meu_projeto
cat > Move.toml << EOF
[package]
name = "meu_projeto"
edition = "2024.beta"

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }

[addresses]
meu_projeto = "0x0"
EOF

mkdir -p sources
touch sources/modulo.move
```

### Workflow de Desenvolvimento

```bash
# 1. Escrever código
# 2. Testar
sui move test

# 3. Build
sui move build

# 4. Publicar (se necessário)
sui client publish --gas-budget 100000000
```

---

## 📚 Recursos Rápidos

- **Docs**: https://docs.sui.io/
- **Move Book**: https://move-language.github.io/move/
- **Examples**: https://github.com/MystenLabs/sui/tree/main/examples
- **Discord**: https://discord.gg/sui
- **Forum**: https://forums.sui.io/

---

## 🐛 Troubleshooting Rápido

### "Client/Server API version mismatch"
Atualizar Sui CLI:
```bash
suiup update sui
```

### "Insufficient gas"
Aumentar gas budget:
```bash
sui client publish --gas-budget 200000000
```

### "Module address mismatch"
Verificar endereço no Move.toml (deve ser `0x0` para publicação)

### "Package not found"
Executar `sui move build` antes de publicar

### Walrus "Not enough WAL"
Obter mais tokens:
```bash
walrus get-wal
```

---

## 💡 Dicas Rápidas

1. ✅ Sempre teste antes de publicar (`sui move test`)
2. ✅ Use `Move.lock` para builds reproduzíveis
3. ✅ Guarde sua frase de recuperação offline
4. ✅ Use devnet para desenvolvimento rápido
5. ✅ Use testnet para testes finais
6. ✅ Documente seus contratos com comentários
7. ✅ Use `assert!` para validações críticas
8. ✅ Prefira `entry` functions para interação externa
9. ✅ Emita eventos para auditabilidade
10. ✅ Teste casos de erro com `#[expected_failure]`

---

**Última atualização:** 12 de novembro de 2025
