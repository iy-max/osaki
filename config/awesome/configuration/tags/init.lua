local awful = require('awful')
local beautiful = require('beautiful')

local createTag = require('helper.create-tag')
local tags = require('configuration.tags.values')

-- Set the layouts we can cycle through
tag.connect_signal('request::default_layouts', function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.max
    })
end)
 
-- Create a tag for each of the tag values
-- Pass an index to make sure the first tag is selected
screen.connect_signal('request::desktop_decoration', function(s)
    for i, tag in pairs(tags) do
        -- Do checks to specify for which tags we do or do not wish to give out gaps
        if tag.layout == 'max' then
            createTag(i, tag.name, tag.icon, s, false)
        else
            createTag(i, tag.name, tag.icon, s)
        end
    end
end)

-- This is to keep focus when changing between tags
tag.connect_signal('property::selected', function(t)
    if t.selected then
        all_clients = t:clients()
        for _, c in ipairs(all_clients) do
            if c:isvisible() then
                client.focus = c 
            end
        end
    end
end)