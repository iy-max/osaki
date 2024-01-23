local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

-- TODO
-- Need to replace command for one that's more versatile, right now it's too dependant on the IF name
--
local watchContainer = require('helper.watch-container')

local watchCallback = function(widget_instance, stdout, stderr, exitreason, exitcode)
    -- Can't use exitcode since for some reason it's returning 1 (TODO)
    -- Strip whitespaces
    result = string.gsub(stdout, '%s+', '')
    if result ~= 'up' then
        widget_instance:set_image(beautiful.icons.network.wired_disconnected)
    else
        widget_instance:set_image(beautiful.icons.network.wired_active)
    end
end

local image = beautiful.icons.network.wired_waiting
local command = 'cat /sys/class/net/enp8s0/operstate | grep up'
local margins = beautiful.panel.icon_slightly_bigger_margin

return watchContainer(watchCallback, image, command, margins)