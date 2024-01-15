-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del({ "n", "v" }, ".")

-- Terminal
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
vim.keymap.set("n", "<M-1>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<M-1>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Commands
vim.keymap.set("n", "<M-x>", "<CMD>Telescope commands<CR>", { desc = "Show commands" })
vim.keymap.set("n", "<C-p>", "<CMD>Telescope commands<CR>", { desc = "Show commands" })

-- GoBack
vim.keymap.set("n", "<c-[>", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "<bs>", "<C-o>", { desc = "Go back" })

-- Comment
local ToggleCommentLine = function()
  vim.api.nvim_input("gcc")
  vim.api.nvim_input("j")
end
local ToggleCommentBloc = function()
  vim.api.nvim_input("gc")
end
vim.keymap.set("n", "<c-/>", ToggleCommentLine, { desc = "Toggle comment", remap = true })
vim.keymap.set("n", "<c-_>", ToggleCommentLine, { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<c-/>", ToggleCommentBloc, { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<c-_>", ToggleCommentBloc, { desc = "Toggle comment", remap = true })

-- Tabs
vim.keymap.set("n", "<M-[>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<M-]>", "<cmd>bnext<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

local CloseOtherBuffers = function()
  vim.cmd("BufferLineCloseOthers")
end
vim.api.nvim_create_user_command("CloseOtherBuffers", CloseOtherBuffers, { desc = "Close other buffers" })

vim.keymap.set("n", "<C-x>", "<leader>bd", { desc = "Close buffer", remap = true })

local ReopenClosedBuffer = function()
  vim.api.nvim_input(":e #<cr>")
end
vim.api.nvim_create_user_command("ReopenClosedBuffer", ReopenClosedBuffer, { desc = "Reopen closed buffer" })
vim.keymap.set("n", "<C-S-x>", ReopenClosedBuffer, { desc = "Reopen closed buffer" })

-- FilesTree
vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory", remap = true })
vim.keymap.set("n", "<M-3>", "<leader>fe", { desc = "Explorer NeoTree (root dir)", remap = true })

-- Files
-- vim.keymap.set("n", "<C-p>", "<leader>ff", { desc = "Find files", remap = true })

-- Git
vim.keymap.set("n", "<leader>gG", "<leader>gG", { desc = "Open git" })
vim.keymap.set("n", "<M-4>", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- TODOs
local ToggleTodos = function()
  vim.cmd("TodoTelescope keywords=TODO,FIX")
end
vim.api.nvim_create_user_command("ToggleTodos", ToggleTodos, { desc = "Show TODOs" })

-- Problems
local ToggleProblems = function()
  require("trouble").toggle()
end
vim.api.nvim_create_user_command("ToggleProblems", ToggleProblems, { desc = "Show Problems" })
vim.keymap.set("n", "<M-5>", ToggleProblems, { desc = "Open problems" })

local ShowLineError = function()
  vim.api.nvim_input(" cd")
end
vim.keymap.set("n", "<Bslash><C-h><Space>", ShowLineError, { desc = "Show line error" })
vim.keymap.set("v", "<Bslash><C-h><Space>", ShowLineError, { desc = "Show line error" })

-- Tests
local ToggleTests = function()
  require("neotest").summary.toggle()
end
vim.api.nvim_create_user_command("ToggleTests", ToggleTests, { desc = "Show Tests" })
vim.keymap.set("n", "<M-6>", ToggleTests, { desc = "Open tests" })

-- Debug
local ToggleDebug = function()
  require("dapui").toggle({})
end
vim.api.nvim_create_user_command("ToggleDebug", ToggleDebug, { desc = "Show Debug" })
vim.keymap.set("n", "<M-7>", ToggleDebug, { desc = "Open debug" })

-- LSP
local ToggleQuickFix = function()
  vim.api.nvim_input(" ca")
end
vim.keymap.set("n", "<M-Enter>", ToggleQuickFix, { desc = "Toggle quick fix" })

local Rename = function()
  vim.api.nvim_input(" cr")
end
vim.api.nvim_create_user_command("Rename", Rename, { desc = "Rename" })

-- MarkdownView
local MarkdownView = function()
  vim.cmd("Glow")
end
vim.api.nvim_create_user_command("MarkdownView", MarkdownView, { desc = "Markdown view" })

-- Git
local Git = function()
  vim.api.nvim_input(" gg")
end
vim.api.nvim_create_user_command("Git", Git, { desc = "Git" })

-- FindAndReplace
local FindAndReplace = function()
  vim.api.nvim_input(" sr")
end
vim.api.nvim_create_user_command("FindAndReplace", FindAndReplace, { desc = "Find and replace" })
