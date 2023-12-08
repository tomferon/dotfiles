local nmap = function(key, desc, f)
  vim.keymap.set("n", key, f, { desc = desc })
end

local normaliseFoldcolumn = function(x)
  return math.min(9, math.max(0, x))
end

nmap("z[", "Disable fold columns", function()
  vim.opt.foldcolumn = "0"
end)
nmap("z<", "Decrement the number of fold columns", function()
  vim.opt.foldcolumn = tostring(normaliseFoldcolumn(tonumber(vim.opt.foldcolumn._value or 0) - 1))
end)
nmap("z>", "Increment the number of fold columns", function()
  vim.opt.foldcolumn = tostring(normaliseFoldcolumn(tonumber(vim.opt.foldcolumn._value or 0) + 1))
end)

nmap("<leader>ut", "Show undo tree", vim.cmd.UndotreeToggle)
