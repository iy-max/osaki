local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

-- My widgets <3
local home_button = require('widget.home-button')
local tagList = require('widget.tag-list')
local systray = require('widget.systray')
local volume = require('widget.volume')
local network = require('widget.network')
local clock = require('widget.clock')
local separator = require('widget.separator')

-- Wibox widget containing the main left panel widgets
local content = function(s)
    return wibox.widget {
        {
            {
                home_button,
                tagList(s),
                spacing = 5,
                spacing_widget = separator('horizontal'),
                widget = wibox.layout.fixed.vertical
            },
            nil,
            {   
                systray,
                volume,
                network,
                clock,
                widget = wibox.layout.fixed.vertical
            },
            widget = wibox.layout.align.vertical
        },
        top = beautiful.panel.top_padding,
        bottom = beautiful.panel.bottom_padding,
        widget = wibox.container.margin
    }
end

return content