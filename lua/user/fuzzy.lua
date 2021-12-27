vim.cmd [[let $FZF_DEFAULT_OPTS='--layout=reverse']]
vim.cmd [[let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{obj/*,build/*,.git/*,.idea/*}"']]
