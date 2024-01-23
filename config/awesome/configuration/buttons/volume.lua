local awful = require('awful')
local gears = require('gears')

local volume_cmds = require('configuration.commands').volume

-- CURRENTLY NOT IN USE
-- BUTTONS AND KEYS ARE IMPLEMENTED ON WIDGET SIDE
return gears.table.join(
    awful.button({ }, 1, function() 
        awful.spawn(volume_cmds.toggle_mute)
    end),
    awful.button({ }, 4, function() awful.spawn(volume_cmds.increase10_limit1_5) end),
    awful.button({ }, 5, function() awful.spawn(volume_cmds.decrease10_limit1_5) end)
)