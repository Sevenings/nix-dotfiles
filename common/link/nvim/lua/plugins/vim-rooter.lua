return {
    {
      'airblade/vim-rooter',
      config = function()
        vim.g.rooter_patterns = {'.venv/', 'pyproject.toml', 'setup.py', 'requirements.txt', '.git/'}
        vim.g.rooter_change_directory_for_non_project_files = 0
        vim.g.rooter_cd_cmd = 'lcd'
      end
    }
}
