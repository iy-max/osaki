local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

beautiful.init(require('theme'))

-- LAYOUT
require('layout')

-- MODULES
require('module.notifications')
require('module.decorate-client')

-- CONFIGURATION
require('configuration.client')
require('configuration.tags')
require('configuration.keys.global')

-- WALLPAPER
screen.connect_signal('request::wallpaper',
    function(s)
        if beautiful.wallpaper then
            awful.wallpaper {
                screen = s,
                widget = {
                    {
                        image = beautiful.wallpaper,
                        -- resize = true,
                        widget = wibox.widget.imagebox
                    },
                    valign = 'center',
                    halign = 'center',
                    widget = wibox.container.place
                }
            }
        end
    end
)

-- GARBAGE COLLECTION