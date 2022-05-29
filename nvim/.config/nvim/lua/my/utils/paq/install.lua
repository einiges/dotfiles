
M = {}

function M.install()
	local install_dir = vim.fn.stdpath('data') ..'/site/pack/paqs/start/paq-nvim'
	local pmgr_repo = 'https://github.com/savq/paq-nvim'

	vim.fn.mkdir(install_dir, 'p')

	local out = vim.fn.system({
		'git', 'clone', '--depth=1',
		pmgr_repo,
		install_dir
	})

	print(out)
end

function M.installed()
	local install_dir = vim.fn.stdpath('data') ..'/site/pack/paqs/start/paq-nvim'

	return vim.fn.empty(vim.fn.glob(install_dir)) <= 0
end

function M.setup()

	if M.installed() then
		vim.notify(
			'Pmgr already installed. \z
				Further investigation required. \z
				Stopping setup.',
			vim.log.levels.WARN)
		return
	end

	vim.ui.input({ prompt = 'Install Pmgr? [Yn] ', default = 'y'},
		function(input)
			if input ~= 'y' then
				return
			end
			M.install()
		end
	)

	vim.cmd('packadd paq-nvim')


	local group = vim.api.nvim_create_augroup('PaqBootstrapQuit', {})
	vim.api.nvim_create_autocmd('User', {
		group = group,
		pattern = 'PaqDoneInstall',
		command = 'quit',
		once = true,
	})
	vim.api.nvim_create_autocmd('VimEnter', {
		group = group,
		pattern = '*',
		once = true,
		callback = require('paq').setup({verbose = true}).install,
	})
end

return M

