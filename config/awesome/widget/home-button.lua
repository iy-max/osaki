local wibox = require('wibox')
local beautiful = require('beautiful')

local buttons = require('configuration.buttons.home')

-- TODO
-- For v0.1 the widget should display rofi when clicked (DONE)
-- Later we want it to display the dashboard
local home_button_widget = wibox.widget {
    {
        {
            image = beautiful.icons.rose,
            widget = wibox.widget.imagebox
        },
        buttons = buttons,
        margins = beautiful.panel.icon_margin,
        widget = wibox.container.margin
    },
    widget = wibox.container.background
}

--home_button_widget:connect_signal('mouse::enter', function(self)
--    self.bg = beautiful.bg_hue300
--end)
--home_button_widget:connect_signal('mouse::leave', function(self)
--    self.bg = '' 
--end)

return home_button_widget