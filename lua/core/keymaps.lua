local commands = require("core.commands");

vim.g.mapleader = " "

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- GoBack
-- vim.keymap.set("n", "<c-[>", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "<bs>", "<C-o>", { desc = "Go back" })

-- ExtensionsManager
vim.keymap.set("n", "<leader>l", commands.ExtensionsManager, { desc = "Extensions manager", remap = true })

-- Exit
vim.keymap.set("n", "<leader>qq", commands.Exit, { desc = "Exit", remap = true })

-- Terminal
vim.keymap.set("n", "<M-1>", commands.ToggleTerminal, { desc = "Toggle terminal", remap = true })

-- Files
-- vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Explorer
vim.keymap.set("n", "<leader>e", commands.ShowFileInExplorer, { desc = "Show file in exploerer" })
vim.keymap.set("n", "<M-3>", commands.ShowFileInExplorer, { desc = "Show file in exploerer" })

-- Comments
vim.keymap.set('n', '<C-_>', commands.CommentLine, { desc = "Comment line" })
vim.keymap.set('v', '<C-_>', require('Comment.api').call('toggle.linewise', 'g@'), { expr = true })

-- Git
vim.keymap.set('n', '<M-4>', commands.ToggleGit, { desc = "Toggle git" })
vim.keymap.set('n', '<leader>gg', commands.ToggleGit, { desc = "Toggle git" })

-- Tabs
vim.keymap.set('n', '<M-]>', '<Cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<M-[>', '<Cmd>BufferPrevious<CR>', {})
vim.keymap.set('n', '<tab>', '<Cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', {})
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>', {})
-- vim.keymap.set('n', '<C-S-x>', '<Cmd>BufferRestore<CR>', {})
vim.keymap.set('n', '<S-x>', '<Cmd>BufferRestore<CR>', {})


-- Tests
vim.keymap.set('n', '<M-5>', commands.ShowTests, { desc = "Show tests" })
vim.keymap.set('n', '<leader>tr', commands.RunNearestTest, { desc = "Run nearest test" })
vim.keymap.set('n', '<leader>tf', commands.RunTestsInFile, { desc = "Run tests in file" })

-- Debug
vim.keymap.set('n', '<M-6>', commands.ToggleDebug, { desc = "Toggle debug" })
vim.keymap.set('n', '<leader>td', commands.DebugNearestTest, { desc = "Debug nearest test" })
vim.keymap.set('n', '<leader>tgd', commands.DebugNearestGoTest, { desc = "Debug nearest go test" })

-- Problems
vim.keymap.set('n', '<M-7>', commands.ToggleProblems, { desc = "Toggle problems" })

-- Outline
vim.keymap.set('n', '<M-8>', commands.ToggleOutline, { desc = "Toggle outline" })


-- Telescope
local telescopeBuiltin = require('telescope.builtin')
--local telescopeUtils = require("telescope.utils")
vim.keymap.set('n', '<leader><leader>', "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files" })
vim.keymap.set('n', '<leader><leader><leader>', "<cmd>Telescope live_grep hidden=true<cr>",
    { desc = "Find string in files" })

vim.keymap.set('n', '<leader>p', telescopeBuiltin.live_grep, { desc = "Find string in files" })
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, { desc = "Find string in files" })
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, { desc = "Find in help" })
vim.keymap.set('n', '<leader>ls', telescopeBuiltin.lsp_document_symbols, {})
vim.keymap.set('n', 'gr', telescopeBuiltin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', telescopeBuiltin.lsp_implementations, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', telescopeBuiltin.lsp_definitions, { noremap = true, silent = true })
-- Commands
vim.keymap.set('n', '<C-p>', telescopeBuiltin.commands, { desc = "Show commands" })
vim.keymap.set('n', '<M-x>', telescopeBuiltin.commands, { desc = "Show commands" })
-- Git
vim.keymap.set('n', '<leader>gb', telescopeBuiltin.git_branches, {})
vim.keymap.set('n', '<leader>gc', telescopeBuiltin.git_commits, {})
vim.keymap.set('n', '<leader>gs', telescopeBuiltin.git_status, {})

-- Sessions
vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
    { desc = "Restore the session for the current directory" })
vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
    { desc = "Restore the last session" })
vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]],
    { desc = "Stop Persistence => session won't be saved on exit" })

-- Rename
vim.keymap.set("n", "<leader>rw", commands.RenameWord, { expr = true })

-- Hurl
vim.keymap.set('n', '<leader>cr', commands.RunCurlRequest,
    { desc = 'Run a curl request from the url under the cursor' })
