local awful = require('awful')
local wibox = require('wibox')

local beautiful = require('beautiful')

return wibox.widget {
    {
        horizontal = false,
        base_size = nil,
        widget = wibox.widget.systray
    },
    margins = beautiful.panel.icon_margin,
    widget = wibox.container.margin
}