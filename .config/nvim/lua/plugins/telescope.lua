local telescope = require("telescope")

telescope.setup {
  extensions = {
    "fzf",
  },
}

local nmap = function(key, func)
  vim.keymap.set("n", key, func)
end

local builtin = require("telescope.builtin")

nmap("<leader>ff", builtin.find_files)
nmap("<leader>fG", builtin.git_files)
nmap("<leader>fg", builtin.live_grep)
nmap("<leader>fb", builtin.buffers)
nmap("<leader>fo", builtin.oldfiles)

nmap("<leader>sr", builtin.registers)
nmap("<leader>sc", builtin.commands)
nmap("<leader>sk", builtin.keymaps)

nmap("<leader>gd", builtin.lsp_definitions)
nmap("<leader>gr", builtin.lsp_references)
nmap("<leader>gi", builtin.lsp_implementations)
nmap("<leader>gT", builtin.lsp_type_definitions)
nmap("<leader>d", builtin.diagnostics)
