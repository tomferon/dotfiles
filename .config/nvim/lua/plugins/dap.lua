local dap = require("dap")
local dapui = require("dapui")

local nmap = function(key, func, desc)
  vim.keymap.set("n", key, func, { desc = "(Debugger) " .. desc })
end
nmap("<leader>bc", dap.continue, "Run or continue")
nmap("<leader>bb", dap.toggle_breakpoint, "Toggle breakpoint")
nmap("<leader>bj", dap.step_over, "Step over")
nmap("<leader>bi", dap.step_into, "Step into")
nmap("<leader>bo", dap.step_out, "Step out")
nmap("<leader>bt", dap.terminate, "Terminate")

dapui.setup {
}

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
