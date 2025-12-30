local ok, annotate = pcall(require, 'code_annotate')
if not ok then
    return
end

annotate.setup()

vim.api.nvim_create_user_command('NoteCreate', annotate.create_annotation, {})
vim.api.nvim_create_user_command('NoteDelete', annotate.delete_annotation, {})
vim.api.nvim_create_user_command('NoteView', annotate.preview_annotation, {})
vim.api.nvim_create_user_command('NoteTelescope', 'Telescope code_annotate current', {})
