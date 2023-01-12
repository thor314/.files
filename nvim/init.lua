vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require "core.init"
require "core.options"

-- setup packer + plugins
local fn = vim.fn
local opt = vim.opt
local api = vim.api
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  opt.cmd "packadd packer.nvim"
  require "plugins"
  opt.cmd "PackerSync"

  -- install binaries from mason.nvim & tsparsers
  api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      opt.cmd "bw | silent! MasonInstallAll" -- close packer window
      require("packer").loader "nvim-treesitter"
    end,
  })
end

pcall(require, "custom")

require("core.utils").load_mappings()

