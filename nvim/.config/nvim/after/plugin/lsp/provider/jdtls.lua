PAQ('mfussenegger/nvim-jdtls') -- More Java LSP Stuff

if not PREQUIRE('jdtls') then
	return
end

local jdtls_root = vim.fn.stdpath('data') .. '/lsp-servers/packages/jdtls/'
local jdtls_bin = vim.fn.glob(jdtls_root .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local workspace = os.getenv('XDG_CACHE_HOME') ..
	'/eclipse/jdtls/' ..
	vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local settings = {
	java = {
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				'org.hamcrest.MatcherAssert.assertThat',
				'org.hamcrest.Matchers.*',
				'org.hamcrest.CoreMatchers.*',
				'org.junit.jupiter.api.Assertions.*',
				'java.util.Objects.requireNonNull',
				'java.util.Objects.requireNonNullElse',
				'org.mockito.Mockito.*'
			},
			filteredTypes = {
				'com.sun.*',
				'io.io.micrometer.shaded.*',
				'java.awt.*',
				'jdk.*',
				'sun.*',
			},
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
			},
			hashCodeEquals = {
				useJava7Objects = false,
			},
			useBlocks = true,
		},

		configuration = {
			runtimes = {
				--{
				--	name = 'JavaSE-1.8',
				--	path = '/usr/lib/jvm/java-8-openjdk/',
				--},
				{
					name = 'JavaSE-18',
					path = '/usr/lib/jvm/java-18-openjdk/',
				},
			}
		},
	},
}

local keymaps = function(bufnr)

	local map = require('my.utils.nvim.keymap')({buffer = bufnr})

	map:set('n', '<leader>ai',
		require('jdtls').organize_imports, {
			desc = 'Organize imports',
	})
	map:set('n', '<leader>aT',
		require('jdtls').test_class, {
			desc = 'Test class',
	})
	map:set('n', '<leader>at',
		require('jdtls').test_nearest_method, {
			desc = 'Test nearest method',
	})
	map:set('v', '<leader>aev',
		function() require('jdtls').extract_variable(true) end, {
			desc = 'Extract variable',
	})
	map:set('n', '<leader>aev',
		require('jdtls').extract_variable, {
			desc = 'Extract variable',
	})
	map:set('v', '<leader>aem',
		function() require('jdtls').extract_method(true) end, {
			desc = 'Extract method',
	})
end

local setup = function()
	local project_dir = require('jdtls.setup').find_root({
		'.git',
		'mvnw', 'pom.xml',
		'gradlew', 'gradle.build',
	})

	-- The command that starts the language server
	local cmd = {
		'java',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx1G',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-jar', jdtls_bin,
		'-configuration', jdtls_root .. '/config_linux',
		'-data', workspace,
		--'-data', project_dir .. '/.jdtls', -- TODO: Get this setup to work
	}


	-- Force myself to create projects
	if not project_dir then
		return
	end

	require('jdtls').start_or_attach({
		cmd = cmd,
		settings = settings,
		capabilities = require('my.lsp.capabilities'),
		on_attach = function(client, bufnr)
			--require('jdtls').setup_dap()
			keymaps(bufnr)
		end,

		filetypes = { 'java' },
	})
end

--Start only when java file is getting edited
vim.api.nvim_create_autocmd({'BufNewFile','BufRead'}, {
	group = vim.api.nvim_create_augroup('StartJdtlsForJava', {}),
	pattern = '*.java',
	callback = setup,
})


