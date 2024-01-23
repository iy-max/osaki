local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local separator = require('widget.separator')

-- Create widget for time
-- We're creating two textclock widgets within a fixed layout 
-- to then place a custom separator between them for the rotated colon
-- May not work as expected
clock_widget = wibox.widget {
    {
        format = '%H\n%m',
        font = beautiful.font_bold,
        widget = wibox.widget.textclock
    },
    widget = wibox.container.place
--    {
--        {
--            format = '%M',
--            font = beautiful.font_bold,
--            widget = wibox.widget.textclock
--        },
--        widget = wibox.container.place
--    },
--    spacing = 10,
--    spacing_widget = {
--        {
--            text = ':',
--            font = beautiful.font_bold,
--            widget = wibox.widget.textbox
--        },
--        direction = 'west',
--        widget = wibox.container.rotate
--    },
--    widget = wibox.layout.fixed.vertical


}

return clock_widget