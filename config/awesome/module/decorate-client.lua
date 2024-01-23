local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')

-- TODO
-- - Need to test what happens whe minimizing a fullscreen window

-- Change shape depending on the type of layout or if app is fullscreen
local clientCallback = function(c)
    current_tag = c.first_tag
    isMax = c.fullscreen or current_tag.layout == awful.layout.suit.max
    if not c.skip_decoration and c.screen then
        if isMax then
            c.shape = gears.shape.rectangle
        else
            c.shape = function(cr, w, h, r)
                gears.shape.rounded_rect(cr, w, h, beautiful.client_radius)
            end
        end
    end
end

-- Add gap depending on the type of layout
local tagCallback = function(t)
    isMax = t.layout == awful.layout.suit.max
    if t.screen then
        if isMax then
            t.gap_single_client = false
        else 
            t.gap_single_client = true
        end
    end

    -- Make sure to render the clients properly based on these changes
    for _, client in pairs(t:clients()) do
        clientCallback(client)
    end
end

-- Signals that could alter a tag's fullscreenMode
client.connect_signal('request::manage', clientCallback)
client.connect_signal('property::fullscreen', clientCallback)
tag.connect_signal('property::layout', tagCallback)