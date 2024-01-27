local awful = require('awful')
local modkey = require('configuration.keys.mod').modkey
local programs = require('configuration.programs')
local commands = require('configuration.commands')

-- GENERAL 
-- Terminal
-- Rofi
-- Quit awesome
-- Reload awesome
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, 'Return', function() awful.spawn(programs.terminal) end),
    awful.key({ modkey }, 'r', function() awful.spawn(programs.app_runner) end),
    awful.key({ }, 'XF86AudioPlay', function() awful.spawn(commands.media.play_pause) end),
    awful.key({ modkey, 'Control' }, 'q', awesome.quit),
    awful.key({ modkey, 'Control' }, 'r', awesome.restart)
})

-- 

-- TAG
-- Switch to tag with index
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        keygroup = 'numrow',
        description = 'View tag',
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end
    },
    awful.key {
        modifiers = { modkey, 'Shift' },
        keygroup = 'numrow',
        description = 'Move focused client to tag',
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end
    }
})

-- FOCUS
-- Focus previous, next client by index
-- Focus previous, next screen
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, 'j', function()
            awful.client.focus.byidx(1)
        end,
        { 
            description = 'Focus next client by index'
        } 
    ),
    awful.key({ modkey }, 'k', function()
            awful.client.focus.byidx(-1)
        end,
        {
            description = 'Focus previous client by index'
        }
    ),
    awful.key({ modkey, 'Control' }, 'j', function()
            awful.screen.focus_relative(1)
        end,
        {
            description = 'Focus the next screen'
        }
    ),
    awful.key({ modkey, 'Control' }, 'k', function()
            awful.screen.focus_relative(-1)
        end,
        {
            description = 'Focus the previous screen'
        }
    )
})

-- LAYOUT
-- Increase, decrease number of master clients
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey, 'Control' },
        keygroup = 'numrow',
        description = 'Select layout directly',
        on_press = function(index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end
    },
    awful.key({ modkey, 'Shift' }, 'j', function()
            awful.client.swap.byidx(1)
        end,
        {
            description = 'Swap with the next client by index'
        }
    ),
    awful.key({ modkey, 'Shift' }, 'k', function()
            awful.client.swap.byidx(-1)
        end,
        {
            description = 'Swap with the previous client by index'
        }
    ),
    awful.key({ modkey, 'Shift' }, 'l', function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {
            description = 'Increase the number of master clients'
        }
    ),
    awful.key({ modkey, 'Shift' }, 'h', function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {
            description = 'Decrease the number of master clients'
        }
    ),
    awful.key({ modkey }, 'space', function()
            awful.layout.inc(1)
        end,
        {
            description = 'Select next layout'
        }
    ),
    awful.key({ modkey, 'Shift' }, 'space', function()
            awful.layout.inc(-1)
        end,
        {
            description = 'Select previous layout'
        }
    ),
})

-- CLIENT (configuration -> configuration.client.buttons .keys)
-- Move, resize with key binds
-- Fullscreen
-- Close
-- Move to screen
-- Minimize (later)
client.connect_signal('request::default_mousebindings', function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function(c)
            c:activate { }
        end),
        awful.button({ modkey }, 1, function(c)
            c:activate { action = 'mouse_move' }
        end),
        awful.button({ modkey }, 3, function(c)
            c:activate { action = 'mouse_resize'}
        end)
    })
end)
client.connect_signal('request::default_keybindings', function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey }, 'f', function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {
                description = 'Toggle fullscreen'
            }
        ),
        awful.key({ modkey, 'Shift' }, 'c', function(c)
                c:kill()
            end,
            {
                description = 'Close'
            }
        ),
        awful.key({ modkey, 'Shift' }, 'f', awful.client.floating.toggle,
            {
                description = 'Toggle floating'
            }
        ),
        awful.key({ modkey }, 'o', function(c)
                c:move_to_screen()
            end,
            {
                description = 'Move to screen'
            }
        )
    })
end)