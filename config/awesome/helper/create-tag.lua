local awful = require('awful')
local beautiful = require('beautiful')

-- Create a tag with the name, icon and screen
return function(index, name, icon, screen, use_gaps)
    if use_gaps == nil then use_gaps = true end
    -- Default entry will enable gaps from theme
    if use_gaps then
        awful.tag.add(name, {
            icon = icon,
            layout = awful.layout.suit.tile,
            gap = beautiful.useless_gap,
            gap_single_client = true,
            selected = index == 1,
            screen = screen
        })
    -- Disable gaps if the use_gaps parameters is set to false
    else
        awful.tag.add(name, {
            icon = icon,
            layout = awful.layout.suit.max,
            gap = beautiful.useless_gap,
            gap_single_client = false,
            selected = index == 1,
            screen = screen
        })
    end
end