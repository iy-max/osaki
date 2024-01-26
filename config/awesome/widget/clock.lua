local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local separator = require('widget.separator')

-- Create widget for time
clock_widget = wibox.widget {
    {
        format = '%H\n%M',
        font = beautiful.font_bold,
        --font = 'Josefin Sans Medium 14',
        widget = wibox.widget.textclock
    },
    valign = 'center',
    widget = wibox.container.place
}

return clock_widget