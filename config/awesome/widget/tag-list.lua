local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local buttons = require('configuration.buttons.tags')

-- Callback ran once every tag widget instance is created, to attach signals or what not
-- self: widget instance, e.g. self:connect_signal(...), self.get_children_by_id['icon_role'][0] to access the imagebox widget (widget)
-- c3: The tag (tag)
-- index: widget pos in list (number)
-- objects: tags: the list of tags (table)
local tagInstanceCallback = function(self, c3, index, tags)
    self:connect_signal('mouse::enter', function()
         self:get_children_by_id('background_role')[1].bg = beautiful.bg_hue300
    end)
    self:connect_signal('mouse::leave', function()
        self:get_children_by_id('background_role')[1].bg = '' 
    end)
    self:connect_signal('add-border', function()
        self:get_children_by_id('selector_margin')[1].color = beautiful.fg_teal
    end)
    self:connect_signal('remove-border', function()
        self:get_children_by_id('selector_margin')[1].color = ''
    end)
    -- For initial border when tags are initialized 
    if c3.selected then self:emit_signal('add-border') end
    c3:connect_signal('property::selected', function()
        if c3.selected then
            self:emit_signal('add-border')
        else
            self:emit_signal('remove-border')
        end
    end)
end

local createTagList = function(s)
    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {
            spacing = 3,
            widget = wibox.layout.fixed.vertical
        },
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        widget = wibox.widget.imagebox
                    },
                    left = beautiful.panel.icon_margin - beautiful.panel.selector_margin,
                    right =  beautiful.panel.icon_margin,
                    top = beautiful.panel.icon_margin,
                    bottom = beautiful.panel.icon_margin,
                    widget = wibox.container.margin
                },
                id = 'selector_margin',
                left = beautiful.panel.selector_margin,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = tagInstanceCallback 
            -- Update callback will take the same arguments as create, but this is ran every time data is refreshed
            -- update_callback = function(self, c3, index, objects)
        },
        buttons = buttons
    }
end

return createTagList