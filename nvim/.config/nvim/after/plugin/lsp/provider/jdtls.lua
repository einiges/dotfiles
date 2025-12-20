PAQ('mfussenegger/nvim-jdtls') -- More Java LSP Stuff

if not PREQUIRE('jdtls') then
	return
end

local runtimes = function()
	local result = {}
	for _, path in
		pairs(vim.split(vim.fn.glob('/usr/lib/jvm/java-*-openjdk'), '\n'))
	do
		table.insert(result, {
			name = 'JavaSE-' .. string.match(path, '(%d+)'),
			path = path,
		})
	end

	return result
end

local settings = function()
	return {
		java = {
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {
					"io.crate.testing.Asserts.assertThat",
					"org.assertj.core.api.Assertions.assertThat",
					"org.assertj.core.api.Assertions.assertThatThrownBy",
					"org.assertj.core.api.Assertions.assertThatExceptionOfType",
					"org.assertj.core.api.Assertions.catchThrowable",
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				filteredTypes = {
					'com.sun.*',
					'io.io.micrometer.shaded.*',
					'java.awt.*',
					'jdk.*',
					'sun.*',
				},
			},
			saveActions = {
				organizeImports = true,
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
				runtimes = runtimes(),
			},
		},
	}
end

local cmd = function()
	local jdtls_root = vim.fn.stdpath('data') .. '/mason/packages/jdtls/'
	local jdtls_bin =
		vim.fn.glob(jdtls_root .. '/plugins/org.eclipse.equinox.launcher_*.jar')

	local data_dir = vim.env.XDG_CACHE_HOME
		.. '/eclipse/jdtls/'
		.. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h')

	return {
		'java',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'--add-modules=ALL-SYSTEM',

		'--add-opens',
		'java.base/java.util=ALL-UNNAMED',

		'--add-opens',
		'java.base/java.lang=ALL-UNNAMED',

		'-jar',
		jdtls_bin,

		'-configuration',
		jdtls_root .. '/config_linux',

		'-data',
		data_dir,
	}
end

local bundles = function()
	local result = {}
	local java_debug = vim.fn.glob(
		vim.fn.stdpath('cache')
			.. '/lsp-servers/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',
		1
	)
	table.insert(result, java_debug)

	local java_test = vim.split(
		vim.fn.glob(
			vim.fn.stdpath('cache')
				.. '/lsp-servers/packages/java-test/extension/server/*.jar',
			1
		),
		'\n'
	)
	vim.list_extend(result, java_test)
	return result
end

local keymaps = function(bufnr)
	local map = require('my.utils.nvim.keymap')():buffer(bufnr)

	map
		:desc('Organize imports')
		:set('n', '<localleader>ai',
			function()
				require('jdtls').organize_imports()
			end)

	map
		:desc('Test class')
		:set('n', '<localleader>T',
			function()
				if vim.bo.modified and vim.bo.modifiable then
					vim.cmd.write()
				end
				require('jdtls').test_class()
			end)

	map
		:desc('Test nearest method')
		:set('n', '<localleader>t',
			function()
				if vim.bo.modified and vim.bo.modifiable then
					vim.cmd.write()
				end
				require('jdtls').test_nearest_method()
			end)

	map
		:desc('Extract variable')
		:set('v', '<localleader>aev',
			function()
				require('jdtls').extract_variable(true)
			end)

	map
		:desc('Extract variable')
		:set('n', '<localleader>aev',
			function()
				require('jdtls').extract_variable()
			end)

	map
		:desc('Extract method')
		:set('v', '<localleader>aem',
			function()
				require('jdtls').extract_method(true)
			end)
end

local setup = function()
	local project_dir = require('jdtls.setup').find_root({
		'.git',
		'mvnw',
		'pom.xml',
		'gradlew',
		'gradle.build',
	})

	-- Force myself to create projects
	if not project_dir then
		return
	end

	local jdtls = require('jdtls')

	local extendedClientCapabilities = jdtls.extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	local config = {
		cmd = cmd(),
		settings = settings(),
		capabilities = require('my.lsp.capabilities'),
		on_attach = function(client, bufnr)
			jdtls.setup_dap({ hotcodereplace = 'auto' })
			keymaps(bufnr)
		end,

		--root_dir = project_dir,

		init_options = {
			bundles = bundles(),
			extendedClientCapabilities = extendedClientCapabilities,
		},
	}

	jdtls.start_or_attach(config)
end

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	desc = [[Start jdtls on java files]],
	group = vim.api.nvim_create_augroup('MyStartJdtls', {}),
	pattern = '*.java',
	callback = setup,
})
