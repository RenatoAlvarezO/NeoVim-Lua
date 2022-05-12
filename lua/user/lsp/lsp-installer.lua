local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
  function dump(o)
    if type(o) == 'table' then
      local s = '{ '
      for k, v in pairs(o) do
        if type(k) ~= 'number' then k = '"' .. k .. '"' end
        s = s .. ' ' .. k .. ' : "' .. dump(v) .. '",'
      end
      return s .. '} '
    else
      return tostring(o)
    end
  end

  if server.name == "ltex" then
    local ltex_opts = require("user.lsp.settings.ltex")
    opts = vim.tbl_deep_extend("force", ltex_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local python_opts = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", python_opts, opts)
  end

  local my_arduino_fqbn = {
    ["/home/h4ck3r/dev/arduino/blink"] = "arduino:avr:nano",
    ["/home/h4ck3r/dev/arduino/sensor"] = "arduino:mbed:nanorp2040connect",
  }
  local DEFAULT_FQBN = "esp8266:esp8266:nodemcuv2"
  if server.name == "arduino_language_server" then
    opts.on_new_config = function(config, root_dir)
      local partial_cmd = server:get_default_options().cmd
      local fqbn = my_arduino_fqbn[root_dir]
      if not fqbn then
        vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
        fqbn = DEFAULT_FQBN
      end
      config.cmd = vim.list_extend(partial_cmd, { "-fqbn", fqbn })
    end
  end
  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
