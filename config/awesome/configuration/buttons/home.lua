local awful = require('awful')
local gears = require('gears')

local app_runner = require('configuration.programs').app_runner

return gears.table.join(
    awful.button({ }, 1, function() awful.spawn(app_runner) end)
)
