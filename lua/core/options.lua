local opt = vim.o

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 自动换行
opt.wrap = true

-- 高亮当前行、列
opt.cursorline = true
opt.cursorcolumn = true

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索不区分大小写
opt.ignorecase = true
opt.smartcase = true

-- undo 永久化
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- 禁用状态条
opt.laststatus = 0

-- Tab 空白符显示
opt.list = true
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"

-- 关闭 Swapfile
opt.swapfile = false

-- 设置 signcolumn 偏移，避免文本跳动
opt.signcolumn = "yes"

-- session
opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

-- shell
opt.shell = "nu"

-- fold
opt.foldenable = true
opt.foldlevel = 99

opt.foldtext = ""
opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})
