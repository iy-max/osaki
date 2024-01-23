local awful = require('awful')
local left_panel = require('layout.left-panel')

screen.connect_signal('request::desktop_decoration', function(s)
    s.left_panel = left_panel(s)
end)

local updateVisibility = function()
    for s in screen do
        if s.selected_tag then
            s.left_panel.visible = not s.selected_tag.fullscreenMode 
        end
    end
end

client.connect_signal('property::fullscreen', function(c)
    c.screen.selected_tag.fullscreenMode = c.fullscreen
    updateVisibility()
end)

tag.connect_signal('property::selected', function()
    updateVisibility()
end)

client.connect_signal('request::unmanage', function(c)
    c.screen.selected_tag.fullscreenMode = false ~= c.fullscreen
    updateVisibility()
end)