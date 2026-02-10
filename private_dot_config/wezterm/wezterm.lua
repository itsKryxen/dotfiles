-- Pull in WezTerm API
local wezterm = require("wezterm")
local act = wezterm.action
local function color_scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
-- config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.use_fancy_tab_bar = false
config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = false
--config.max_fps = 120
--config.animation_fps = 120
config.keys = {
	{ key = "n", mods = "ALT", action = act.DisableDefaultAssignment },
	{ key = "q", mods = "CTRL|SHIFT", action = act.QuickSelect },
}
config.enable_tab_bar = false

-- Return config to WezTerm
return config
