local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local panelContent = require('layout.left-panel.content')
-- local panel_dashboard = require('layout.left-panel.dashboard')

-- Left panel
local leftPanel = function(s)
    -- Create panel wibox for our content to go in 
    local panel = wibox {
        screen = s,
        ontop = true,
        visible = true,
        width = beautiful.panel.width,
        height = s.geometry.height,
        x = s.geometry.x,
        y = s.geometry.y,
        bg = beautiful.bg_normal,
        fg = beautiful.fg_normal,
        widget = panelContent(s)
    }

    -- Set reserved space for panel 
    panel:struts(
        {
            left = beautiful.panel.width
        }
    )

    return panel
end

return leftPanel 