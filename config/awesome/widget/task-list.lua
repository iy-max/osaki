local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

--local task_buttons = require('configuration.buttons.tasks')

local createTaskList = function(s)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        --buttons = task_buttons,
        widget_template = {
            {
                {
                    {
                        id = 'clienticon',
                        widget = awful.widget.clienticon
                    },
                    margins = beautiful.panel.icon_margin,
                    widget = wibox.container.margin
                },
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox
                },
                widget = wibox.layout.fixed.horizontal
            },
            id = 'background_role',
            widget = wibox.container.background
            -- create_callback self, c3, index, objects [tags]
        }
    }
end

return createTaskList