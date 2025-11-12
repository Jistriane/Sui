![banner](./recursos/imagens/banner.jpg)
# Primeiros passos em Sui

## Introdução

**Sui** é uma plataforma de blockchain e contratos inteligentes de **camada 1** projetada para que a propriedade de ativos digitais seja rápida, privada, segura e acessível.

**Move** é uma linguagem de código aberto para escrever pacotes seguros para manipular objetos na blockchain. Ela permite bibliotecas, ferramentas e comunidades de desenvolvedores comuns em blockchains com modelos de dados e execução muito diferentes.

## Instalando um editor de código

Para este tutorial, instalaremos o **Visual Studio Code**.

1. Baixe o instalador para o seu sistema operacional na [página oficial do Visual Studio](https://code.visualstudio.com/)
2. (Opcional) Recomendamos instalar as seguintes extensões:
    * [Move (Extension)](https://marketplace.visualstudio.com/items?itemName=mysten.move) é uma extensão de servidor de linguagem para Move mantida pela [Mysten Labs](https://www.mystenlabs.com/).
    * [Move Formatter](https://marketplace.visualstudio.com/items?itemName=mysten.prettier-move) é um formatador de código para Move, desenvolvido e mantido pela Mysten Labs.
    * [Move Syntax](https://marketplace.visualstudio.com/items?itemName=damirka.move-syntax) uma simples extensão de realce de sintaxe para Move por [Damir Shamanaev](https://github.com/damirka/).

## Clonando este repositório

> :information_source: Certifique-se de ter acesso a um console em seu computador com permissões para instalação de software.

## 1. Instalação do Git

1. [Instalação no Mac](#macgit)
2. [Instalação no Windows](#windowsgit)
3. [Instalação no Linux](#linuxgit)

## Instalação no Mac <a id="macgit"></a>

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install git
```
3. Se precisar de mais informações sobre a instalação, você pode encontrá-las na documentação [oficial do Git](https://www.git-scm.com/download/mac).

## Instalação no Windows <a id="windowsgit"></a>

1. Baixe o instalador na página oficial do Git: [https://www.git-scm.com/download/win](https://www.git-scm.com/download/win).
2. Siga as instruções indicadas. As opções padrão do instalador geralmente são suficientes, mas se você quiser personalizar sua instalação de alguma forma e souber o que está fazendo, sinta-se à vontade para mudar o que for necessário.

## Instalação no Linux <a id="linuxgit"></a>

1. Para distribuições baseadas em Debian, como o Ubuntu, você pode executar os seguintes comandos:
```bash
sudo apt update
sudo apt install git-all
```
2. Se precisar de informações sobre a instalação em alguma outra distribuição específica, você pode encontrá-las na documentação [oficial do Git](https://git-scm.com/download/linux).

## 2. Configurando o Git

É uma boa ideia configurar os valores globais do seu usuário antes de começar a usar o Git. Você pode fazer isso com os seguintes comandos.

> :information_source: Lembre-se de substituir os exemplos com seus dados pessoais.
```sh
git config --global user.name "Nome Exemplo"
git config --global user.email nome@exemplo.com
```

## 3. Clonando o repositório localmente

No seu terminal, execute o seguinte comando:

```sh
git clone https://github.com/AguaPotavel/sui-first-steps.git
```

> :information_source: Lembre-se que você pode mudar o diretório onde o repositório será clonado. Utilize `cd` para se mover entre os diretórios do seu computador, e `mkdir` para criar um novo. </br></br>
> Mais informações: [Tutorial de comandos básicos](https://aprendolinux.com/aprende-los-comandos-basicos-de-linux/).

Uma vez que o repositório for clonado, você pode navegar até ele:
```sh
cd sui-first-steps
```

Para visualizar o conteúdo, você pode executar o comando:

```sh
ls -a
```

E para abri-lo no editor de código (no nosso caso, VS Code), você pode executar:
```sh
code .
```

## 3. Instalação da Sui CLI

Para poder interagir com o conteúdo dos tutoriais, é necessário instalar a **Sui CLI**.

1. [Instalação no Mac](#maccli)
2. [Instalação no Windows](#windowscli)
3. [Instalação no Linux](#linuxcli)

## Instalação no Mac <a id="maccli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o Hombrew. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe suiup-macOS-arm64.tar.gz.
> * Se aparecer **x86_64** → Baixe suiup-macOS-x86_64.tar.gz.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### Hombrew

1. Certifique-se de ter o **Homebrew** instalado: [https://brew.sh/](https://brew.sh/).
2. Abra um terminal e insira os seguintes comandos:
```sh
brew update
brew install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Windows <a id="windowscli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando um gerenciador de pacotes como o **Chocolatey**. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

1. Baixe o instalador diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases).

> :information_source: Se você não sabe qual arquitetura possui, simplesmente baixe o arquivo `suiup-Windows-msvc-x86_64.zip`.

2. Uma vez instalado, abra um terminal e execute o seguinte comando para verificar se tudo correu bem:
```sh
suiup --version
```
> :information_source: Recomendamos usar o Powershell como terminal para executar todos os comandos deste repositório no Windows.

3. Depois de instalar o `suiup`, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

4. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `choco`

1. Certifique-se de ter o **Chocolatey** instalado: [https://chocolatey.org/install](https://chocolatey.org/install).
2. Abra um terminal e insira o seguinte comando:
```sh
choco install sui
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## Instalação no Linux <a id="linuxcli"></a>

Podemos instalar o Sui de duas maneiras. Uma usando a ferramenta desenvolvida pela MystenLabs, `suiup`, e outra utilizando o gerenciador de pacotes para **Rust** chamado `cargo`. A recomendada para dar seus primeiros passos sem a necessidade de muitas configurações é `suiup`, no entanto, esta ferramenta não deve ser utilizada em ambientes de produção. Vamos explorar ambas as opções.

### `suiup`

* Execute o seguinte comando no seu terminal:
```sh
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

* Ou você pode baixar os binários e instalá-lo manualmente diretamente do [repositório oficial do `suiup`](https://github.com/Mystenlabs/suiup/releases). Esta opção é um pouco mais avançada, então se você nunca instalou algo de forma semelhante, recomendamos usar o comando acima.

> :information_source: Se você não sabe qual arquitetura possui, pode executar o seguinte comando:
> ```sh
> uname -m
> ```
> * Se aparecer **arm64** → Baixe `suiup-Linux-musl-arm64.tar.gz`.
> * Se aparecer **x86_64** → Baixe `suiup-Linux-musl-x86_64.tar.gz`.

1. Você pode testar se a instalação do `suiup` foi bem-sucedida executando o seguinte comando:
```sh
suiup --version
```

2. Depois de instalar o `suiup`, independentemente da opção escolhida, execute o seguinte comando para instalar a Sui CLI:
```sh
suiup install sui
```

3. E novamente, você pode testar se tudo correu bem usando:
```sh
sui --version
```

### `cargo`

1. Certifique-se de ter o `rustup` instalado: [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install).
2. Abra um terminal e insira os seguintes comandos:
```sh
rustup update stable
cargo install --git https://github.com/MystenLabs/sui.git sui --branch devnet
```
3. Você pode testar se tudo foi instalado corretamente executando:
```sh
sui --version
```

## 4. Instalação do MVR

O **Move Registry** (MVR) é um gerenciador de pacotes para o Move. Ele permite a qualquer pessoa publicar e utilizar pacotes publicados em novas aplicações desenvolvidas com o Move. 

1. A forma de instalar o `mvr` depende de como você instalou a `sui` CLI.

* Se você instalou com `suiup` (independentemente do seu sistema operacional), execute o seguinte comando:
```sh
suiup install mvr
```

* Se você instalou o `sui` utilizando `cargo`, execute o seguinte comando:
```sh
cargo install --locked --git https://github.com/mystenlabs/mvr --branch release mvr
```

* Por último, se você realizou a instalação manualmente baixando o instalador e **não** instalou o `suiup`, pode baixar o instalador do `mvr` no [repositório oficial](https://github.com/MystenLabs/mvr/releases).

2. Independentemente da opção escolhida, lembre-se de verificar se a instalação foi realizada corretamente:
```sh
mvr --version
```

## 5. Interagindo com o repositório

O repositório é composto por várias pastas com arquivos para cada tutorial, simplesmente navegue até elas usando `cd` e siga as instruções dentro delas.</br></br>
Cada tutorial possui um arquivo `README.md` com instruções claras de como interagir com eles.

---

## 📚 Estrutura do Repositório

Este repositório está organizado em módulos progressivos para facilitar o aprendizado da linguagem Move e da plataforma Sui:

### 🎯 Backend - Tutoriais Principais

Localização: `backend/`

#### Tutoriais Base (00-10)

1. **00_intro** - Introdução ao Sui e primeiros passos com Move
2. **01_variables** - Variáveis e constantes em Move
   - Projeto extra: **todolist** - Sistema de tarefas na blockchain
3. **02_referencias** - Referências mutáveis e imutáveis
4. **03_tipos_primitivos** - Tipos primitivos (bool, u8, u64, u128, u256)
5. **04_condicionais** - Estruturas condicionais (if/else, assert)
6. **05_vetores** - Vetores e manipulação de coleções
7. **06_strings** - Strings e manipulação de texto
8. **07_structs** - Estruturas de dados personalizadas
9. **08_habilidades** - Habilidades (copy, drop, store, key)
10. **09_address** - Endereços e identificadores
11. **10_funcoes** - Funções e modificadores de visibilidade

#### 🎓 Desafios Resolvidos

Projetos práticos criados para consolidar o aprendizado:

- **03_tipos_primitivos/desafio_comparacao** - Comparações e operadores lógicos
- **04_condicionais/desafio_idade** - Validação de idade com if/else e assert
- **05_vetores/desafio_matriz** - Matriz 3x3 com vetores aninhados
- **06_strings/desafio_poema** - Manipulação de strings (poema de 4 linhas)
- **07_structs/desafio_escola** - Sistema escolar com structs aninhadas

#### 🏆 Projeto Completo

**projeto_completo/** - Sistema de Biblioteca
- Integra todos os 10 conceitos dos tutoriais
- Gerenciamento completo de livros (CRUD)
- Eventos de empréstimo
- Busca por ano de publicação
- Demonstra boas práticas de Move

### 🔧 Extras - Ferramentas Avançadas

Localização: `extras/`

#### Sui Client (`extras/sui_client/`)
Tutorial completo sobre configuração e uso do cliente Sui:
- Configuração de carteira e redes
- Gerenciamento de ambientes (mainnet, testnet, devnet, localnet)
- Obtenção de tokens de teste
- Publicação de pacotes na blockchain

#### Walrus (`extras/walrus/`)
Tutorial sobre armazenamento descentralizado:
- Instalação e configuração do Walrus
- Upload de arquivos grandes (blobs) na blockchain
- Download e verificação de arquivos
- Compartilhamento público de blobs
- Gestão de tokens WAL

---

## ✅ Status de Conclusão

### Tutoriais Executados
- ✅ Todos os 11 tutoriais principais (00-10) testados
- ✅ 13 testes unitários passando nos tutoriais originais
- ✅ 2 bugs corrigidos nos tutoriais originais

### Desafios Concluídos
- ✅ 5 projetos de desafio criados e testados
- ✅ 8 testes unitários passando nos desafios
- ✅ 1 projeto completo integrando todos os conceitos
- ✅ 2 testes de integração passando

### Configurações Realizadas
- ✅ Sui Client configurado com wallet ed25519
- ✅ Ambiente devnet configurado e testado
- ✅ Pacote publicado na blockchain Sui
- ✅ Ambiente testnet configurado
- ✅ Walrus instalado e configurado
- ✅ Tokens WAL obtidos e testados

### Arquivos Gerados
- ✅ Move.lock gerado para todos os projetos (7 projetos)
- ✅ Arquivos de build gerados
- ✅ Bytecode compilado

---

## 🚀 Comandos Úteis

### Testando um Projeto
```bash
cd backend/[nome-do-tutorial]
sui move test
```

### Construindo um Projeto
```bash
cd backend/[nome-do-projeto]
sui move build
```

### Publicando na Blockchain
```bash
cd backend/[nome-do-projeto]
# Certifique-se de que o endereço no Move.toml está como 0x0
sui client publish --gas-budget 100000000
```

### Verificando Ambiente Ativo
```bash
sui client active-env
```

### Mudando de Ambiente
```bash
sui client switch --env [devnet|testnet|mainnet]
```

### Obtendo Tokens de Teste
```bash
# Para devnet
sui client faucet

# Para testnet (use a UI web)
# https://faucet.sui.io/?address=SEU_ENDERECO
```

---

## 📊 Estatísticas do Projeto

| Métrica | Valor |
|---------|-------|
| Total de Projetos | 18 |
| Tutoriais Base | 11 |
| Desafios | 5 |
| Projetos Extras | 2 |
| Testes Passando | 23 |
| Linhas de Código Move | ~1000+ |
| Pacotes Publicados | 1 |
| Gas Consumido | ~0.0406 SUI |

---

## 🔍 Informações de Deployment

### Pacote Publicado (00_intro)
- **Network**: Devnet
- **Package ID**: `0x765c3918b992228cb0a44a2e289ba01f9db9cf2de03d496db25020e99789f98c`
- **Transaction Digest**: `BUU1kwco9dKpGxVoQJUtjtXDZduRwDv3FbjGjX5qexv4`
- **Gas Cost**: ~0.0406 SUI

### Walrus Blob Armazenado
- **Blob ID**: `xbhRB460J_8TUYXpnPuuaz3KzatyQpIeQlwTKpGNrhc`
- **Object ID**: `0xddea702026241cb2f2f08a2d8c3dd80dce28826c459b89d3bd3a34c28cd8b4e7`
- **Shared Object ID**: `0x7a3baf5f84101a4b4b4a3ddca3d8caf71d32bf79167a024db72a6737f07849f8`
- **Tamanho Original**: 13 B
- **Tamanho Codificado**: 63.0 MiB
- **Custo**: 0.011 WAL
- **Expira**: Epoch 223

---

## 🎯 Conceitos Aprendidos

### Fundamentos de Move
- ✅ Variáveis e constantes
- ✅ Tipos primitivos (bool, u8, u16, u32, u64, u128, u256)
- ✅ Referências mutáveis e imutáveis
- ✅ Estruturas condicionais (if/else, assert)
- ✅ Vetores e coleções
- ✅ Strings e UTF-8

### Conceitos Avançados
- ✅ Structs personalizadas
- ✅ Habilidades (copy, drop, store, key)
- ✅ Endereços e identificadores
- ✅ Funções públicas e de entrada (entry)
- ✅ Modificadores de visibilidade
- ✅ Eventos (emit)
- ✅ Objetos compartilhados vs owned

### Blockchain Sui
- ✅ Configuração de carteiras
- ✅ Gerenciamento de redes
- ✅ Publicação de pacotes
- ✅ Interação com faucets
- ✅ Consulta de objetos
- ✅ Gerenciamento de gas

### Armazenamento Descentralizado
- ✅ Walrus - conceitos básicos
- ✅ Upload e download de blobs
- ✅ Gestão de tokens WAL
- ✅ Compartilhamento de arquivos
- ✅ Verificação de status

---

## 🐛 Bugs Corrigidos

Durante a execução dos tutoriais, foram identificados e corrigidos os seguintes bugs:

1. **tipos_primitivos.move**: Variável `negacao` sendo chamada como `negacion`
2. **address.move**: Funções com nomes em espanhol (`practica_*`) corrigidos para português (`pratica_*`)

---

## 💡 Dicas e Boas Práticas

### Desenvolvimento
- Use `sui move test` frequentemente para validar seu código
- Mantenha os arquivos `Move.lock` no controle de versão
- Configure diferentes ambientes para desenvolvimento e produção
- Use `assert!` para validações críticas

### Deployment
- Sempre teste em devnet antes de publicar em testnet ou mainnet
- Configure o endereço como `0x0` no `Move.toml` para publicação
- Monitore os custos de gas
- Documente os Package IDs e Transaction Digests

### Segurança
- Guarde sua frase de recuperação em local seguro
- Nunca compartilhe suas chaves privadas
- Use ambientes de teste para experimentação
- Valide todas as entradas de usuário

---

## 📖 Recursos Adicionais

### Documentação Oficial
- [Sui Documentation](https://docs.sui.io/)
- [Move Language](https://move-language.github.io/move/)
- [Walrus Documentation](https://docs.wal.app/)

### Ferramentas
- [Sui Explorer](https://suiexplorer.com/)
- [Sui Faucet](https://faucet.sui.io/)
- [Move Registry](https://github.com/MystenLabs/mvr)

### Comunidade
- [Sui Discord](https://discord.gg/sui)
- [Sui Forum](https://forums.sui.io/)
- [GitHub Sui](https://github.com/MystenLabs/sui)

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Se você encontrou algum problema ou tem sugestões de melhoria:

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

---

## 📝 Licença

Este projeto é uma tradução e adaptação do material original. Consulte o repositório original para informações sobre licenciamento.

---

## 🙏 Créditos

Este repositório é uma tradução para o português do projeto original em espanhol desenvolvido por [WayLearnLatam](https://github.com/WayLearnLatam). Você pode encontrar o repositório original em:

**Repositório Original:** [https://github.com/WayLearnLatam/sui-first-steps](https://github.com/WayLearnLatam/sui-first-steps)

Agradecemos à equipe WayLearnLatam por criar este excelente material educativo sobre Sui e Move.

### Desenvolvimento e Testes
- Todos os tutoriais foram executados e validados
- Desafios adicionais foram criados e testados
- Configurações de Sui Client e Walrus foram implementadas
- Publicação na blockchain foi realizada com sucesso

---

## 📞 Suporte

Se você tiver dúvidas ou precisar de ajuda:

- 📧 Abra uma issue no GitHub
- 💬 Entre na comunidade Sui no Discord
- 📚 Consulte a documentação oficial

---

**Desenvolvido com ❤️ para a comunidade Sui em português**
