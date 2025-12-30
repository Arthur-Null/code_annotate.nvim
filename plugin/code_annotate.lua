local ok, annotate = pcall(require, 'code_annotate')
if not ok then
    return
end

local function ensure_setup()
    if not annotate.config then
        annotate.setup {}
    end
end

local function command_exists(cmd)
    return vim.fn.exists(':' .. cmd) == 2
end

local function wrap(fn)
    return function(...)
        ensure_setup()
        return fn(...)
    end
end

if not command_exists('NoteCreate') then
    vim.api.nvim_create_user_command('NoteCreate', wrap(annotate.create_annotation), {})
end

if not command_exists('NoteDelete') then
    vim.api.nvim_create_user_command('NoteDelete', wrap(annotate.delete_annotation), {})
end

if not command_exists('NoteView') then
    vim.api.nvim_create_user_command('NoteView', wrap(annotate.preview_annotation), {})
end

if not command_exists('NoteTelescope') then
    vim.api.nvim_create_user_command('NoteTelescope', function()
        ensure_setup()
        vim.cmd 'Telescope code_annotate current'
    end, {})
end
