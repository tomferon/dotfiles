local telescope = require("telescope")

telescope.setup {
  extensions = {
    "fzf",
  },
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
  },
}

local nmap = function(key, func, desc)
  vim.keymap.set("n", key, func, { desc = desc })
end

local builtin = require("telescope.builtin")

nmap("<leader>ff", builtin.find_files, "Find files")
nmap("<leader>fG", builtin.git_files, "Find git files")
nmap("<leader>fg", builtin.live_grep, "Live grep")
nmap("<leader>fb", builtin.buffers, "Find buffers")
nmap("<leader>fo", builtin.oldfiles, "Find old files")

nmap("<leader>sr", builtin.registers, "Show registers")
nmap("<leader>sc", builtin.commands, "Show commands")
nmap("<leader>sk", builtin.keymaps, "Show keymaps")
nmap("<leader>sn", telescope.extensions.notify.notify, "Show notifications")

nmap("<leader>gd", builtin.lsp_definitions, "Go to definition")
nmap("<leader>gr", builtin.lsp_references, "Go to references")
nmap("<leader>gi", builtin.lsp_implementations, "Go to implementations")
nmap("<leader>gT", builtin.lsp_type_definitions, "Go to type definition")
nmap("<leader>d", builtin.diagnostics, "Show diagnostics")
