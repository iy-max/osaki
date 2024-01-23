local awful = require('awful')
local ruled = require('ruled')

local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        rule       = { },
        properties = {
            focus                = awful.client.focus.filter,
            raise                = true,
            --keys                 = client_keys,
            --buttons              = client_buttons,
            screen               = awful.screen.preferred,
            placement            = awful.placement.no_offscreen,
            floating             = false,
            maximized            = false,
            above                = false,
            below                = false,
            ontop                = false,
            sticky               = false,
            maximized_horizontal = false,
            maximized_vertical   = false,
            titlebars_enabled    = false
        }
    }
    
    -- Tag-specific rules --
    --ruled.client.append_rule {
    --    rule_any    = { class = { 'Firefox' }},
    --    properties  = {
    --        tag                 = 'Browser'
    --    }
    --}

    --ruled.client.append_rule {
    --    rule_any    = { class = { 'code-oss' }},
    --    properties  = {
    --        tag                 = 'Code'
    --    }
    --}

    --ruled.client.append_rule {
    --    rule_any    = { class = { 'Spotify' }},
    --    properties  = {
    --        tag                 = 'Music'
    --    }
    --}

    --ruled.client.append_rule {
    --    rule_any    = { class = { 'steamwebhelper', 'steam' }},
    --    properties  = {
    --        tag                 = 'Game'
    --    }
    --}

end)