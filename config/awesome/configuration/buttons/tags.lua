local awful = require('awful')
local gears = require('gears')

return gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
)