return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python"
  },
  config = function ()
    local function get_python_path()
      local cwd = vim.fn.getcwd()
      local venv_python = cwd .. "/.venv/bin/python"
      if vim.fn.executable(venv_python) == 1 then
        return venv_python
      end
      return "python3"
    end

    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          args = { "--log-level", "DEBUG" },
          runner = "pytest",
          python = get_python_path(),
        })
      },
    })
  end
}

