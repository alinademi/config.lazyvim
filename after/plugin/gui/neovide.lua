-- Define the Neovide settings in a table
local neovide_settings = {
    gui_font_default_size = 19,
    gui_font_size = 19,
    gui_font_face = "SFMono Nerd Font",
    transparency = 1.0,
    neovide_background_color = "#10121B",
    neovide_scale_factor = 1.00,
    neovide_confirm_quit = true,
    neovide_input_use_logo = 1
}

-- Apply the settings if Neovide is active
if vim.g.neovide then
    -- Helper function for transparency formatting
    local function alpha()
        return string.format("%x", math.floor(255 * (neovide_settings.transparency or 0.9)))
    end

    -- Font settings
    vim.g.gui_font_default_size = neovide_settings.gui_font_default_size
    vim.g.gui_font_size = neovide_settings.gui_font_size
    vim.g.gui_font_face = neovide_settings.gui_font_face

    -- Refresh Gui Font
    function RefreshGuiFont()
        vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
    end

    -- Resize Gui Font
    function ResizeGuiFont(delta)
        vim.g.gui_font_size = vim.g.gui_font_size + delta
        RefreshGuiFont()
    end

    -- Reset Gui Font
    function ResetGuiFont()
        vim.g.gui_font_size = vim.g.gui_font_default_size
        RefreshGuiFont()
    end

    -- Call function on startup to set default value
    ResetGuiFont()

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set({ 'n', 'i' }, "<C-+>", function() ResizeGuiFont(1) end, opts)
    vim.keymap.set({ 'n', 'i' }, "<C-_>", function() ResizeGuiFont(-1) end, opts)
    vim.keymap.set({ 'n', 'i' }, "<C-BS>", function() ResetGuiFont() end, opts)

    -- Other settings
    vim.g.neovide_transparency = neovide_settings.transparency
    vim.g.transparency = 1.0
    vim.g.neovide_background_color = neovide_settings.neovide_background_color .. alpha()
    vim.g.neovide_scale_factor = neovide_settings.neovide_scale_factor
    vim.opt.linespace = 5
    vim.g.neovide_confirm_quit = neovide_settings.neovide_confirm_quit
    vim.g.neovide_input_use_logo = neovide_settings.neovide_input_use_logo

    -- Key bindings
    vim.keymap.set('n', '<D-s>', ':w<CR>')
    vim.keymap.set('v', '<D-c>', '"+y')
    vim.keymap.set('n', '<D-v>', '"+P')
    vim.keymap.set('v', '<D-v>', '"+P')
    vim.keymap.set('c', '<D-v>', '<C-R>+')
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')

    -- Blinking cursor
    vim.cmd [[
        autocmd GUIEnter * set guicursor=a:blinkon0
        autocmd GUIEnter * set guicursor+=i:ver25-blinkon0
        autocmd GUIEnter * set guicursor+=r:hor20
        autocmd GUIEnter * set guicursor+=c:hor20
    ]]
end
