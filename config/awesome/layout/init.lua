local awful = require('awful')
local left_panel = require('layout.left-panel')
local top_panel = require('layout.top-panel')

screen.connect_signal('request::desktop_decoration', function(s)
    s.left_panel = left_panel(s)
    s.top_panel = top_panel(s)
end)

local updateVisibility = function()
    for s in screen do
        if s.selected_tag then
            s.left_panel.visible = not s.selected_tag.fullscreenMode 
            s.top_panel.visible = not s.selected_tag.fullscreenMode
        end
    end
end

tag.connect_signal('property::selected', function()
    updateVisibility()
end)

client.connect_signal('property::fullscreen', function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateVisibility()
end)

client.connect_signal('request::unmanage', function(c)
    c.screen.selected_tag.fullscreenMode = false ~= c.fullscreen
    updateVisibility()
end)