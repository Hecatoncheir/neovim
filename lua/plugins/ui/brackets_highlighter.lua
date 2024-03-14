local api = vim.api
local ts_get_node_text = vim.treesitter.get_node_text or vim.treesitter.query.get_node_text

local ts_utils = require('nvim-treesitter.ts_utils')
local parsers = require('nvim-treesitter.parsers')

local M = {}


M.setup = function(opt)
    local group = api.nvim_create_augroup('brackets_highlighter_buf', { clear = true })
    local filetype = vim.bo.filetype
    api.nvim_create_autocmd({ 'CursorMoved' }, {
        group = group,
        pattern = '*.lua,*.dart',
        callback = function(data)
            local buf = data.buf

            vim.fn.sign_define("brackets_open_and_close", { text = "󱋷" })
            vim.fn.sign_define("bracket_open", { text = "" })
            vim.fn.sign_define("bracket_close", { text = "" })

            M.onCursorMove(buf)
        end
    })
end

M.onCursorMove = function(buf)
    local target_node = ts_utils.get_node_at_cursor()
    if target_node == nil then return end
    print(target_node:type())

    local node = M.findNodeForBracketsHightlight(target_node)
    if node == nil then
        M.hideBrackets()
        return
    end;

    local begin_node_line, end_node_line = M.findBeginAndEndNodeLines(node)
    if begin_node_line == end_node_line then
        M.hideBrackets()
        M.showOpenAndCloseBracketsOnLine(buf, begin_node_line)
        return
    end

    M.hideBrackets()
    M.showOpenBracketOnLine(buf, begin_node_line)
    M.showCloseBracketOnLine(buf, end_node_line)
end

M.hideBrackets = function()
    vim.fn.sign_unplace("brackets_open_and_close")
    vim.fn.sign_unplace("bracket_open")
    vim.fn.sign_unplace("bracket_close")
end

M.showOpenAndCloseBracketsOnLine = function(buf, lineNumber)
    vim.fn.sign_place(0, "brackets_open_and_close", "brackets_open_and_close", buf, { lnum = lineNumber })
end

M.showOpenBracketOnLine = function(buf, lineNumber)
    vim.fn.sign_place(0, "bracket_open", "bracket_open", buf, { lnum = lineNumber })
end

M.showCloseBracketOnLine = function(buf, lineNumber)
    vim.fn.sign_place(0, "bracket_close", "bracket_close", buf, { lnum = lineNumber })
end

M.findNodeForBracketsHightlight = function(node)
    if (node:type() == 'block') then
        return node
    end

    if (node:type() == 'class_definition') then
        return node
    end

    if (node:type() == 'class_body') then
        return node
    end

    if (node:type() == 'function_definition') then
        return node
    end

    if (node:type() == 'formal_parameter_list') then
        return node
    end

    if (node:type() == 'function_body') then
        return node
    end

    if (node:type() == 'arguments') then
        return node
    end

    if (node:type() == 'identifier') then
        return node
    end

    if (node:type() == 'type_identifier') then
        return node
    end

    if (node:type() == 'optional_formal_parameters') then
        return node
    end

    if (node:type() == 'if_statement') then
        return node
    end

    if (node:type() == 'program') then
        return node
    end

    local parentNode = node:parent()
    if parentNode == nil then return end

    return M.findNodeForBracketsHightlight(node:parent())
end

M.findBeginAndEndNodeLines = function(node)
    local begin_node_line, _, end_node_line = node:range()
    begin_node_line = begin_node_line + 1
    end_node_line = end_node_line + 1
    return begin_node_line, end_node_line
end


--  TODO: remove
M.setup()

return M
