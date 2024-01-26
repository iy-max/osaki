local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local formatImageColor = require('helper.format-image')
local close_icon = require('theme.icons.format-strings').close

--local task_buttons = require('configuration.buttons.tasks')
local buttons = {
    awful.button({ }, 1, function(c)
        c:activate { 
            context = 'tasklist',
        --    action = 'toggle_minimization'
        } 
    end)
}

-- Set client name everytime name is updated, cut string if length greater than 24
local taskInstanceCallback = function(self, c, index, clients)
    -- Check text length and cut if longer than 24
    if string.len(c.name) > 24 then
        new_client_name = string.sub(c.name, 1, 25)
        self:get_children_by_id('my_text_role')[1].text = new_client_name .. '...'
    else
        self:get_children_by_id('my_text_role')[1].text = c.name
    end

end

local createTaskInstanceCallback = function(self, c, index, clients)
    -- Update name length
    taskInstanceCallback(self, c, index, clients)

    -- Change color when mouse enter / leave the task widget instance --
    self:connect_signal('mouse::enter', function()
        self:get_children_by_id('background_role')[1].bg = beautiful.bg_hue300
    end)
    self:connect_signal('mouse::leave', function()
        self:get_children_by_id('background_role')[1].bg = ''
    end)

    -- Add remove border selector based on focus -- 
    self:connect_signal('add-border', function()
        self:get_children_by_id('selector_margin')[1].color = beautiful.fg_teal
    end)
    self:connect_signal('remove-border', function()
        self:get_children_by_id('selector_margin')[1].color = ''
    end)

    -- If client is already focused then add selector
    if client.focus == c then self:emit_signal('add-border') end
    c:connect_signal('focus', function()
         self:emit_signal('add-border')
    end)
    c:connect_signal('unfocus', function()
        self:emit_signal('remove-border')
    end)

    -- Close icon functionality / decoration --
    self:get_children_by_id('close_icon')[1]:connect_signal('mouse::enter', function()
        self:get_children_by_id('close_icon')[1].image = formatImageColor(close_icon, beautiful.fg_white)
    end)
    self:get_children_by_id('close_icon')[1]:connect_signal('mouse::leave', function()
        self:get_children_by_id('close_icon')[1].image = beautiful.icons.close
    end)

    -- Add buttons to close_icon
    self:get_children_by_id('close_icon')[1].buttons = {
        awful.button({ }, 1, function()
            c:kill()
        end)
    }
end

local createTaskList = function(s)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        --buttons = task_buttons,
        widget_template = {
            {
                {
                    {
                        {
                            id = 'clienticon',
                            widget = awful.widget.clienticon
                        },
                        margins = beautiful.panel.icon_slightly_bigger_margin,
                        widget = wibox.container.margin
                    },
                    {
                        {
                            {
                                id = 'my_text_role',
                                font = beautiful.font,
                                widget = wibox.widget.textbox
                            },
                            id = 'foreground_role',
                            fg = beautiful.fg_white,
                            widget = wibox.container.background
                        },
                        top = beautiful.panel.icon_margin,
                        bottom = beautiful.panel.icon_margin,
                        widget = wibox.container.margin
                    },
                    {
                        {
                            id = 'close_icon',
                            image = beautiful.icons.close,
                            widget = wibox.widget.imagebox
                        },
                        margins = beautiful.panel.icon_margin,
                        widget = wibox.container.margin
                    },
                    widget = wibox.layout.align.horizontal
                },
                id = 'selector_margin',
                bottom = beautiful.panel.selector_bigger_margin,
                widget = wibox.container.margin,
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = createTaskInstanceCallback,
            update_callback = taskInstanceCallback
        },
        buttons = buttons
    }
end

return createTaskList