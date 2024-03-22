-- Extensions
local ExtensionsManager = function()
    vim.cmd('Lazy')
end
vim.api.nvim_create_user_command('ExtensionsManager', ExtensionsManager, { desc = "Extensions manager" })

-- Exit
local Exit = function()
    vim.cmd('qa')
end
vim.api.nvim_create_user_command('Exit', Exit, { desc = "Exit" })

-- Theme
local ChangeTheme = function()
    vim.cmd('Themery')
end
vim.api.nvim_create_user_command('ChangeTheme', ChangeTheme, { desc = "Change theme" })

-- Explorer
local ShowFileInExplorer = function()
    vim.cmd('NvimTreeFindFileToggle')
end
vim.api.nvim_create_user_command('ShowFileInExplorer', ShowFileInExplorer, { desc = "Show file in exploerer" })

-- Tabs
local CloseOtherTabs = function()
    vim.cmd('BufferCloseAllButCurrentOrPinned')
end
vim.api.nvim_create_user_command('CloseOtherTabs', CloseOtherTabs, { desc = "Close other tabs" })

local CloseTabsToTheLeft = function()
    vim.cmd('BufferCloseBuffersLeft')
end
vim.api.nvim_create_user_command('CloseTabsToTheLeft', CloseTabsToTheLeft, { desc = "Close tabs to the left" })

local CloseTabsToTheRight = function()
    vim.cmd('BufferCloseBuffersRight')
end
vim.api.nvim_create_user_command('CloseTabsToTheRight', CloseTabsToTheRight, { desc = "Close tabs to the right" })

local Reopen = function()
    vim.cmd('BufferRestore')
end
vim.api.nvim_create_user_command('Reopen', Reopen, { desc = "Reopen closed tab" })

-- Comments
local commentApi = require('Comment.api')
local CommentLine = function()
    commentApi.toggle.linewise.current()
    vim.api.nvim_input('j')
end
local CommentLines = function()
    commentApi.call('toggle.linewise', 'g@')
end

-- Git
local lazyGit;
local ToggleGit = function()
    if lazyGit == nil then
        local Terminal = require('toggleterm.terminal').Terminal
        lazyGit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "double",
            },
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-4>", "<cmd>close<CR>",
                    { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-1>", "<cmd>close<CR>",
                    { noremap = true, silent = true })
            end,
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })
    end
    lazyGit:toggle()
end
vim.api.nvim_create_user_command('ToggleGit', ToggleGit, { desc = "Toggle gigt" })

-- TODOs
local ToggleTodos = function()
    vim.cmd('TodoTelescope keywords=TODO,FIX')
end
vim.api.nvim_create_user_command('ToggleTodos', ToggleTodos, { desc = "Show TODOs" })

-- Problems
local ToggleProblems = function()
    require("trouble").toggle()
end
vim.api.nvim_create_user_command('ToggleProblems', ToggleProblems, { desc = "Show Problems" })

-- Tests
local ShowTests = function()
    require("neotest").summary.toggle()
end
vim.api.nvim_create_user_command('ShowTests', ShowTests, { desc = "Show tests" })

local ShowTestsOutput = function()
    require("neotest").output_panel.toggle()
end
vim.api.nvim_create_user_command('ShowTestsOutput', ShowTestsOutput, { desc = "Show tests output" })

local RunAllTests = function()
    require("neotest").run.run({ suite = true })
end
vim.api.nvim_create_user_command('RunAllTests', RunAllTests, { desc = "Run all tests" })

local RunTestsInFile = function()
    require("neotest").run.run(vim.fn.expand("%"))
end
vim.api.nvim_create_user_command('RunTestsInFile', RunTestsInFile, { desc = "Run tests in file" })

local RunNearestTest = function()
    require("neotest").run.run()
end
vim.api.nvim_create_user_command('RunNearestTest', RunNearestTest, { desc = "Run nearest test" })

local ReRunLatestTest = function()
    require("neotest").run.run_last();
end
vim.api.nvim_create_user_command('ReRunLatestTest', ReRunLatestTest, { desc = "Re run latest test" })

-- Debug
local ToggleDebug = function()
    require("dapui").toggle()
end
vim.api.nvim_create_user_command('ToggleDebug', ToggleDebug, { desc = "Toggle debug" })

local DebugNearestTest = function()
    require("neotest").run.run({ strategy = "dap" })
    -- require('dap-go').debug_test()
end
vim.api.nvim_create_user_command('DebugNearestTest', DebugNearestTest, { desc = "Debug nearest test" })

local DebugNearestGoTest = function()
    require('dap-go').debug_test()
end
vim.api.nvim_create_user_command('DebugNearestGoTest', DebugNearestGoTest, { desc = "Debug nearest go test" })

local FileStructure = function()
    local telescopeBuiltin = require('telescope.builtin')
    telescopeBuiltin.lsp_document_symbols()
end
vim.api.nvim_create_user_command('FileStructure', FileStructure, { desc = "Show file structure" })

local FindAndReplace = function()
    require('spectre').toggle();
end
vim.api.nvim_create_user_command('FindAndReplace', FindAndReplace, { desc = "Find and replace string in files" })

local GoBack = function()
    vim.api.nvim_input("<C-o>")
end
vim.api.nvim_create_user_command('GoBack', GoBack, { desc = "Go back" })

local Rename = function()
    vim.lsp.buf.rename()
end
vim.api.nvim_create_user_command('Rename', Rename, { desc = "Rename" })

local RenameWord = function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end
vim.api.nvim_create_user_command('RenameWord', RenameWord, { desc = "Rename word" })

local RunHttpRequest = function()
    require('rest-nvim').run()
    -- require('rest-nvim').run_request()
end
vim.api.nvim_create_user_command('RunHttpRequest', RunHttpRequest, { desc = "Run http request" })

local RunCurlRequest = function()
    vim.cmd('CurlGoFromCursor')
end
vim.api.nvim_create_user_command('RunCurlRequest', RunCurlRequest,
    { desc = "Run a curl request from the url under the cursor" })

local RunHurlRequest = function()
    vim.cmd('HurlRunVerbose')
end
vim.api.nvim_create_user_command('RunHurlRequest', RunHurlRequest,
    { desc = "Run a hurl request from the url under the cursor" })

local ShowLineDiagnostics = function()
    vim.diagnostic.open_float()
end
vim.api.nvim_create_user_command('ShowLineDiagnostics', ShowLineDiagnostics,
    { desc = "Shows the current line's diagnostics in a floating window" })

local terminal;
local ToggleTerminal = function()
    if terminal == nil then
        local Terminal = require('toggleterm.terminal').Terminal
        terminal = Terminal:new({
            direction = 'vertical',
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<M-1>', [[<Cmd>ToggleTerminal<CR>]], opts)
            end,
            on_close = function(term)
                vim.cmd("startinsert!")
            end,
        })
    end
    terminal:toggle()
end
vim.api.nvim_create_user_command('ToggleTerminal', ToggleTerminal, { desc = "Toggle terminal" })


local ToggleOutline = function()
    require("aerial").toggle()
end
vim.api.nvim_create_user_command('ToggleOutline', ToggleOutline, { desc = "Toggle outline" })

local ToggleWrap = function()
    if (vim.o.wrap == true) then
        vim.o.wrap = false
    else
        vim.o.wrap = true
    end
end
vim.api.nvim_create_user_command('ToggleWrap', ToggleWrap, { desc = "Toggle wrap" })


local commands               = {}
commands.Exit                = Exit
commands.ChangeTheme         = ChangeTheme
commands.ShowFileInExplorer  = ShowFileInExplorer
commands.CloseOtherTabs      = CloseOtherTabs
commands.CloseTabsToTheLeft  = CloseTabsToTheLeft
commands.CloseTabsToTheRight = CloseTabsToTheRight
commands.Reopen              = Reopen
commands.CommentLine         = CommentLine
commands.CommentLines        = CommentLines
commands.ExtensionsManager   = ExtensionsManager
commands.ToggleGit           = ToggleGit
commands.ToggleTodos         = ToggleTodos
commands.ToggleProblems      = ToggleProblems
commands.ShowTests           = ShowTests
commands.RunNearestTest      = RunNearestTest
commands.RunTestsInFile      = RunTestsInFile
commands.ReRunLatestTest     = ReRunLatestTest
commands.ToggleDebug         = ToggleDebug
commands.DebugNearestTest    = DebugNearestTest
commands.DebugNearestGoTest  = DebugNearestGoTest
commands.FileStructure       = FileStructure
commands.GoBack              = GoBack
commands.RunHttpRequest      = RunHttpRequest
commands.RunCurlRequest      = RunCurlRequest
commands.RunHurlRequest      = RunHurlRequest
commands.RenameWord          = RenameWord
commands.ShowLineDiagnostics = ShowLineDiagnostics
commands.ToggleTerminal      = ToggleTerminal
commands.ToggleOutline       = ToggleOutline
commands.ToggleWrap          = ToggleWrap
return commands
