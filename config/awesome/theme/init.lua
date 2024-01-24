local filesystem = require('gears.filesystem')
local beautiful = require('beautiful')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = beautiful.xresources.apply_dpi

local formatImageColor = require('helper.format-image')
local icons_format_strings = require('theme.icons.format-strings')

local theme = {}

theme.icons_dir = theme_dir .. '/icons'
theme.icons = {}

-- GENERAL --
theme.useless_gap = dpi(20)

-- COLORS --
-- theme.bg_normal = '#490030'
theme.bg_normal = '#2D132C'
theme.bg_hue300 = '#6B366B'
theme.fg_normal = '#FC5185'
theme.fg_white = '#F5F5F5'
theme.fg_teal = '#3FC1C9'

theme.fg_normal_bright75 = '#BF3D65'
theme.fg_normal_bright70 = '#B2395E'

-- ICONS --
theme.icons.unavail = theme.icons_dir .. '/unavail.svg'

-- Home
theme.icons.rose = theme.icons_dir .. '/rose-pink.svg'

-- Tags
theme.icons.tags = {}
theme.icons.tags_dir = theme.icons_dir .. '/tags'

theme.icons.tags.browser = formatImageColor(icons_format_strings.browser, theme.fg_normal)
theme.icons.tags.code = formatImageColor(icons_format_strings.code, theme.fg_normal) -- _bright70)
theme.icons.tags.music = formatImageColor(icons_format_strings.music, theme.fg_normal)-- _bright70)
theme.icons.tags.game = formatImageColor(icons_format_strings.game, theme.fg_normal)--_bright70)
theme.icons.tags.experiment = formatImageColor(icons_format_strings.experiment, theme.fg_normal)

-- Network
theme.icons.network = {}
theme.icons.network_dir = theme.icons_dir .. '/network'
theme.icons.network.wired_active = theme.icons.network_dir .. '/wired-active.svg'
theme.icons.network.wired_disconnected = theme.icons.network_dir .. '/wired-disconnected.svg'
theme.icons.network.wired_waiting = theme.icons.network_dir .. '/wired-waiting.svg'

-- Volume
theme.icons.volume = {}
theme.icons.volume_dir = theme.icons_dir .. '/volume'
theme.icons.volume.max = theme.icons.volume_dir .. '/max.svg'
theme.icons.volume.min = theme.icons.volume_dir .. '/min.svg'
theme.icons.volume.off= theme.icons.volume_dir .. '/off.svg'
theme.icons.volume.muted = theme.icons.volume_dir .. '/muted.svg'

-- PANEL -- 
theme.panel = {}
theme.panel_width = dpi(40) 
theme.panel_height = dpi(45)
theme.panel_icon_margin = dpi(8)

theme.panel.width = dpi(40)
theme.panel.height = dpi(48)
theme.panel.icon_margin = dpi(8)
theme.panel.icon_slightly_smaller_margin = dpi(6)
theme.panel.icon_slightly_bigger_margin = dpi(10)
theme.panel.selector_margin = dpi(2)
theme.panel.separator_ratio = 0.6
theme.panel.top_padding = dpi(0)
theme.panel.bottom_padding = dpi(5)

-- CLIENT --
theme.client_radius = dpi(20)
-- theme.border_width = dpi(10)
--theme.border_color = theme.fg_normal

-- Fonts
theme.font_regular = 'RobotoMono Nerd Font Mono Regular 12'
theme.font_medium = 'RobotoMono Nerd Font Mono Medium 12'
theme.font_semibold = 'RobotoMono Nerd Font Mono SemiBold 12'
theme.font_bold = 'RobotoMono Nerd Font Mono Bold 12'
theme.font_bold_20 = 'RobotoMono Nerd Font Mono Bold 20'

-- Wallpaper
theme.wallpaper = theme_dir .. '/wallpaper.png'

return theme