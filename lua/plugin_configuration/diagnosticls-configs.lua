local status_ok, dlsconfig = pcall(require, 'diagnosticls-configs')
if not status_ok then
	return
end

local shellcheck = require 'diagnosticls-configs.linters.shellcheck'
local rubocop = require('diagnosticls-configs.linters.rubocop')

dlsconfig.setup {
	['sh'] = {
		linter = shellcheck,
	},
	['ruby'] = {
		linter = rubocop,
	}
}
