local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local panelContent = require('layout.top-panel.content')

-- Top panel
local topPanel = function(s)
    local panel = wibox {
        screen = s,
        ontop = true,
        visible = true,
        width = s.geometry.width - beautiful.panel.width,
        height = beautiful.panel.height,
        x = s.geometry.x + beautiful.panel.width,
        y = s.geometry.y,
        bg = beautiful.bg_normal,
        fg = beautiful.fg_normal,
        widget = panelContent(s)
    }

    panel:struts {
        {
            top = beautiful.panel.height
        }
    }

    return panel
end

return topPanel