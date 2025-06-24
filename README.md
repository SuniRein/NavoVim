# 依赖

## LSP

| 名称 | 语言 | Mason |
| --- | --- | --: |
| [clangd](https://github.com/clangd/clangd) | `c` `cpp` | ✅ |
| [rust_analyzer](https://github.com/rust-lang/rust-analyzer) | `rust` | |
| [html](https://github.com/microsoft/vscode-html-languageservice) | `html` | ✅ |
| [ts_ls](https://github.com/typescript-language-server/typescript-language-server) | `JS` `TS` `vue` | ✅ |
| [vuels](https://github.com/vuejs/language-tools) | `vue` | ✅ |
| [lua_ls](https://github.com/LuaLS/lua-language-server) | `lua` | ✅ |
| [svlangserver](https://github.com/imc-trading/svlangserver) | `verilog` | ✅ |
| [jsonls](https://github.com/microsoft/vscode-json-languageservice) | `json` | ✅ |
| [yamlls](https://github.com/redhat-developer/yaml-language-server) | `yaml` | ✅ |
| [taplo](https://github.com/tamasfe/taplo) | `toml` | ✅ |
| [tinymist](https://github.com/Myriad-Dreamin/tinymist) | `typst` | ✅ |
| [bashls](https://github.com/bash-lsp/bash-language-server) | `bash` `zsh` | ✅ |
| [neocmake](https://github.com/neocmakelsp/neocmakelsp) | `cmake` | ✅ |
| [just](https://github.com/terror/just-lsp) | `just` | ✅ |
| [nushell](https://www.nushell.sh) | `nushell` | |
| [typos_lsp](https://github.com/tekumara/typos-lsp) | | ✅ |

### 备注

- `rust_analyzer` 由 [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) 配置，不通过 [lspconfig][lspconfig]
- `vuels` 由 `ts_ls` 集成，无需手动配置（需通过 [Mason][mason] 安装）
- `nushell` 由 nushell 本体自带，无需额外安装
- `jsonls` 与 `yamlls` 均通过 [SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) 继承 Schema 支持

[lspconfig]: https://github.com/neovim/nvim-lspconfig
[mason]: https://github.com/mason-org/mason.nvim

## Linter

| 名称 | 语言 | Mason |
| --- | --- | --: |
| [eslint_d](https://github.com/mantoni/eslint_d.js/) | `JS` `TS` `vue` | ✅ |
| [verilator](https://github.com/verilator/verilator) | `verilog` | |
| [shellcheck](https://www.shellcheck.net/) | `bash` `zsh` | ✅ |
| [`actionlint`](https://github.com/rhysd/actionlint) | `ghaction` | ✅ |

### 备注

- `shellcheck` 由 `bashls` 自动集成
- `verilator` 由 `svlangserver` 自动集成
- `actionlint` 需设置 `ghaction` 文件类型

## Formatter

| 名称 | 语言 | Mason |
| --- | --- | --: |
| [clang-format](https://clang.llvm.org/docs/ClangFormat.html) | `c` `cpp` | ✅ |
| [stylua](https://github.com/JohnnyMorganz/StyLua) | `lua` | ✅ |
| [eslint_d](https://github.com/mantoni/eslint_d.js/) | `JS` `TS` `vue` | ✅ |
| [prettierd](https://github.com/fsouza/prettierd) | `html` `css` `JS` `TS` `vue` `yaml` | ✅ |
| [verible](https://chipsalliance.github.io/verible/) | `verilog` | ✅ |
| [fixjson](https://github.com/rhysd/fixjson) | `json` | ✅ |
| [typstyle](https://enter-tainer.github.io/typstyle/) | `typst` | ✅ |

### 备注

- `verible` 由 `svlangserver` 自动集成
- `typstyle` 由 `tinymist` 自动集成

## DAP

| 名称 | 语言 | Mason |
| --- | --- | --: |
| [codelldb](https://github.com/vadimcn/codelldb) | `c` `cpp` `rust` | ✅ |


