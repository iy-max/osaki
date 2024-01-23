local awful = require('awful')
local wibox = require('wibox')

return function(callback, image, command, margins, buttons)
    -- Create an image widget with the defined image
    local image_widget = wibox.widget {
        image = image,
        buttons = buttons,
        widget = wibox.widget.imagebox
    }

    -- Create a watch widget with the provided callback function to alter the image widget
    -- function can use any of these args in that order widget, stdout, stderr, exitreason, exitcode
    local watch_widget = awful.widget.watch(
        command,
        3,
        callback,
        image_widget 
    )

    -- Return this same widget in a margin container with the margins value or table
    return wibox.widget {
        watch_widget,
        margins = margins,
        widget = wibox.container.margin
    }
end