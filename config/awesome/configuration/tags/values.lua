local beautiful = require('beautiful')
local tag_icons = beautiful.icons.tags

-- Table entries to modify
-- - tag name
-- - tag icon
-- - defaultApp (no use yet)
return {
    {
        name = 'Browser',
        icon = tag_icons.browser,
        -- defaultApp = 
    },
    {
        name = 'Code',
        icon = tag_icons.code
    },
    {
        name = 'Music',
        icon = tag_icons.music
    },
    {
        name = 'Game',
        icon = tag_icons.game
    }
}