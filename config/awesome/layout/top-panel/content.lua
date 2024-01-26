local wibox = require('wibox')

local taskList = require('widget.task-list')
local home_button = require('widget.home-button')

local content = function(s)
    return wibox.widget {
        taskList(s),
        nil,
        nil,
        widget = wibox.layout.align.horizontal
    }
end

return content