# Neovim Config

Configuração do Neovim com visual estilo VS Code, LSP completo, Copilot e Git integrado.

---

## Requisitos

- Neovim >= 0.11
- Git
- [Node.js](https://nodejs.org/) (para LSPs de JS/TS)
- `xclip` — necessário para clipboard funcionar no Linux

```bash
# Ubuntu / Debian
sudo apt install xclip

# Fedora
sudo dnf install xclip
```

---

## Instalação

```bash
git clone <url-do-repo> ~/.config/nvim
```

Abra o Neovim. O [lazy.nvim](https://github.com/folke/lazy.nvim) instala todos os plugins automaticamente na primeira abertura.

Após a instalação dos plugins, execute `:Lazy sync` para garantir que tudo está atualizado.

---

## Fonte (Nerd Font)

Os ícones nos plugins (árvore de arquivos, bufferline, lualine) exigem uma Nerd Font.

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv
```

Configure o terminal para usar **JetBrainsMono Nerd Font Regular**:

```
Preferences → Profile → Text → Custom font → JetBrainsMono Nerd Font Regular
```

---

## Plugins

| Plugin | Descrição |
|--------|-----------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Gerenciador de plugins |
| [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) | Tema visual estilo VS Code |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | Árvore de arquivos lateral |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Abas (buffers) no topo |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Barra de status inferior |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Busca de arquivos e texto |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocomplete |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Engine de snippets |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua) + [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp) | GitHub Copilot integrado ao autocomplete |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Configuração de LSPs |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Instalador de LSPs/linters |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Fecha automaticamente `{`, `(`, `[`, `"`, etc. |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Fecha e renomeia tags HTML/JSX automaticamente |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Indicadores Git na coluna lateral + blame inline |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Visualizador de diffs e histórico Git |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal integrado |

---

## Servidores LSP

Instalados automaticamente pelo Mason:

| Linguagem | Servidor |
|-----------|----------|
| JavaScript / TypeScript | `ts_ls` |
| HTML | `html` |
| CSS | `cssls` |
| JSON | `jsonls` |
| Python | `pyright` |
| PHP | `intelephense` |
| C / C++ | `clangd` |
| C# | `omnisharp` |
| Docker | `dockerls` |

Para instalar servidores adicionais manualmente: `:Mason`

---

## Atalhos de Teclado

### Arquivo / Edição

| Atalho | Ação |
|--------|------|
| `Ctrl+S` | Salvar |
| `Ctrl+Q` | Fechar |
| `Ctrl+Z` | Desfazer |
| `Ctrl+Y` | Refazer |

### Clipboard

| Atalho | Ação |
|--------|------|
| `Ctrl+C` | Copiar seleção |
| `Ctrl+X` | Recortar seleção |
| `Ctrl+V` | Colar |
| `Ctrl+A` | Selecionar tudo |

### Navegação

| Atalho | Ação |
|--------|------|
| `Ctrl+F` | Buscar no arquivo |
| `Esc` | Limpar highlight da busca |
| `Ctrl+Left` | Pular palavra para esquerda |
| `Ctrl+Right` | Pular palavra para direita |
| `Home` | Início da linha (ignora espaços) |
| `End` | Fim da linha |

### Seleção

| Atalho | Ação |
|--------|------|
| `Shift+Left/Right/Up/Down` | Selecionar por caractere/linha |
| `Ctrl+Shift+Left/Right` | Selecionar por palavra |
| `Ctrl+Shift+Up/Down` | Selecionar linhas |
| `Shift+Home` | Selecionar até início da linha |
| `Shift+End` | Selecionar até fim da linha |

### Indentação (modo visual)

| Atalho | Ação |
|--------|------|
| `Tab` | Indentar seleção |
| `Shift+Tab` | Desindentar seleção |

### Explorer e Busca

| Atalho | Ação |
|--------|------|
| `Ctrl+B` | Abrir/fechar árvore de arquivos |
| `Ctrl+P` | Buscar arquivo pelo nome |
| `Ctrl+Shift+F` | Busca global (grep) |

### Abas (Buffers)

| Atalho | Ação |
|--------|------|
| `Ctrl+Tab` | Próxima aba |
| `Ctrl+Shift+Tab` | Aba anterior |
| `Ctrl+W` | Fechar aba atual |

### Terminal

| Atalho | Ação |
|--------|------|
| `Ctrl+\`` | Abrir/fechar terminal integrado |

### LSP

| Atalho | Ação |
|--------|------|
| `gd` | Ir para definição |
| `gr` | Ver referências |
| `gi` | Ir para implementação |
| `K` | Documentação (hover) |
| `F2` | Renomear símbolo |
| `F12` | Ir para definição |
| `Ctrl+.` / `<leader>ca` | Code actions |
| `Shift+Alt+F` | Formatar arquivo |

### Diagnósticos

| Atalho | Ação |
|--------|------|
| `<leader>e` | Ver erro/aviso da linha atual |
| `[d` | Diagnóstico anterior |
| `]d` | Próximo diagnóstico |

---

## Autocomplete (nvim-cmp)

| Atalho | Ação |
|--------|------|
| `Tab` | Selecionar próximo item |
| `Shift+Tab` | Selecionar item anterior |
| `Enter` | Confirmar seleção |

As sugestões incluem (em ordem de prioridade): Copilot, LSP, snippets, buffer e caminhos de arquivo.

---

## Diffview — Visualizador de Diffs Git

O [diffview.nvim](https://github.com/sindrets/diffview.nvim) permite visualizar diffs e o histórico de commits diretamente no Neovim.

### Abrir / Fechar

| Comando | Descrição |
|---------|-----------|
| `:DiffviewOpen` | Abre o diff das mudanças atuais (unstaged + staged) |
| `:DiffviewOpen HEAD~1` | Diff comparando com o commit anterior |
| `:DiffviewOpen main` | Diff comparando com a branch `main` |
| `:DiffviewOpen abc123..def456` | Diff entre dois commits específicos |
| `:DiffviewClose` | Fecha o diffview |
| `:DiffviewToggleFiles` | Mostra/oculta o painel lateral de arquivos |

### Histórico de commits

| Comando | Descrição |
|---------|-----------|
| `:DiffviewFileHistory` | Histórico de commits do arquivo atual |
| `:DiffviewFileHistory %` | Idem (forma explícita para o arquivo atual) |
| `:DiffviewFileHistory --range=HEAD~10..HEAD` | Histórico dos últimos 10 commits |

> No modo visual, selecione linhas e execute `:DiffviewFileHistory` para ver o histórico apenas daquela região.

### Navegação dentro do Diffview

| Atalho | Ação |
|--------|------|
| `]c` | Próxima diferença |
| `[c` | Diferença anterior |
| `<Tab>` | Próximo arquivo na lista |
| `<S-Tab>` | Arquivo anterior na lista |
| `gf` | Abrir arquivo no buffer atual |
| `<leader>e` | Focar no painel de arquivos |
| `q` | Fechar o diffview |

### Staging direto no Diffview

Com o diffview aberto (`:DiffviewOpen`):

| Atalho | Ação |
|--------|------|
| `-` (sobre um arquivo) | Adicionar/remover do stage (toggle) |
| `S` | Fazer stage de todos os arquivos |
| `U` | Fazer unstage de todos os arquivos |
| `X` | Descartar alterações do arquivo |

---

## Copilot

O Copilot funciona integrado ao autocomplete (nvim-cmp), aparecendo como sugestões normais na lista de completions.

Para autenticar:

```
:Copilot auth
```

---

## Formatação Automática

O arquivo é formatado automaticamente ao salvar (`BufWritePre`) usando o formatter do LSP ativo. Para formatar manualmente: `Shift+Alt+F`.

---

## Estrutura dos Arquivos

```
~/.config/nvim/
├── init.lua                  # Bootstrap, opções globais, LSP enable
├── lazy-lock.json            # Versões travadas dos plugins
└── lua/
    ├── keymaps.lua           # Todos os atalhos de teclado
    └── plugins/
        ├── autopairs.lua     # Fechamento automático de pares
        ├── autotag.lua       # Fechamento automático de tags HTML
        ├── bufferline.lua    # Abas no topo
        ├── cmp.lua           # Autocomplete
        ├── copilot.lua       # GitHub Copilot
        ├── diffview.lua      # Visualizador de diffs Git
        ├── gitsigns.lua      # Indicadores Git na coluna lateral
        ├── lsp.lua           # LSP + Mason
        ├── lualine.lua       # Barra de status
        ├── telescope.lua     # Busca de arquivos
        ├── terminal.lua      # Terminal integrado
        ├── theme.lua         # Tema VS Code
        └── tree.lua          # Árvore de arquivos
```
