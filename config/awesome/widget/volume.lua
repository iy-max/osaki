local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local volume_cmds = require('configuration.commands').volume

-- Callback to Get the current volume and update the icon accordingly
local volumeCallback = function(widget_instance)
    awful.spawn.easy_async(volume_cmds.get, function(out)
        -- Icons to use
        local max = beautiful.icons.volume.max
        local min = beautiful.icons.volume.min
        local off = beautiful.icons.volume.off
        local muted = beautiful.icons.volume.muted

        local current_volume = tonumber(out)
        if(current_volume == nil) then
            widget_instance:set_image(beautiful.icons.volume.muted)
        elseif(current_volume <= 1.5 and current_volume > 0.75) then
            widget_instance:set_image(beautiful.icons.volume.max)
        elseif(current_volume <= 0.75 and current_volume > 0) then
            widget_instance:set_image(beautiful.icons.volume.min)
        elseif(current_volume == 0) then
            widget_instance:set_image(beautiful.icons.volume.off)
        end
    end)
end

local easy_spawn = function(cmd, callback, widget_instance)
    awful.spawn.easy_async(cmd, function()
        callback(widget_instance)
    end)
end

-- Creation of widgets
local volume_widget = wibox.widget {
    image = beautiful.icons.volume.off,
    widget = wibox.widget.imagebox
}

local my_widget = wibox.widget {
    volume_widget,
    --margins = beautiful.panel.icon_slightly_bigger_margin,
    left = beautiful.panel.icon_slightly_bigger_margin,
    right = beautiful.panel.icon_slightly_bigger_margin,
    widget = wibox.container.margin
}

-- Call once to set volume icon, otherwise volume will be off until keybind is hit
volumeCallback(volume_widget)

-- Set mouse binds to call volumeCallback
volume_widget:set_buttons({
    awful.button({ }, 1, function() 
        easy_spawn(volume_cmds.toggle_mute, volumeCallback, volume_widget)
    end),
    awful.button({ }, 4, function()
        easy_spawn(volume_cmds.increase10_limit1_5, volumeCallback, volume_widget)
    end),
    awful.button({ }, 5, function()
        easy_spawn(volume_cmds.decrease10_limit1_5, volumeCallback, volume_widget)
    end)
})

-- Call volumeCallback everytime we use volume-related keybinds 
awful.keyboard.append_global_keybindings({
    awful.key({ }, 'XF86AudioRaiseVolume', function()
        easy_spawn(volume_cmds.increase10_limit1_5, volumeCallback, volume_widget)
    end),
    awful.key({ }, 'XF86AudioLowerVolume', function()
        easy_spawn(volume_cmds.decrease10_limit1_5, volumeCallback, volume_widget)
    end),
    awful.key({ }, 'XF86AudioMute', function()
        easy_spawn(volume_cmds.toggle_mute, volumeCallback, volume_widget)
    end)
})

return my_widget 