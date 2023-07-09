local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-attached', function(_)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then window:gui_window():maximize() end
	end
end)

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.default_prog = { '/usr/bin/zsh' }
config.font_size = 14
config.cursor_blink_rate = 0
config.audible_bell = 'Disabled'
config.check_for_updates = false
config.font = wezterm.font_with_fallback({ 'JetBrainsMono Nerd Font', 'Noto Sans Mono', 'Noto Fonts Emoji' })
config.window_decorations = 'RESIZE'

return config
