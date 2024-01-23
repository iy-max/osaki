local wibox = require('wibox')
local beautiful = require('beautiful')

return function(orientation)
    local separator = wibox.widget {
        orientation = orientation,   
        color = beautiful.bg_hue300,
        thickness = 1,
        span_ratio = beautiful.panel.separator_ratio,
        widget = wibox.widget.separator
    }

    return separator
end