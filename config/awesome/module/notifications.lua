local naughty = require('naughty')

-- TODO
-- Add custom notification to match the theme's aesthetic

-- Error handling
naughty.connect_signal('request::display_error', function(msg, startup)
    naughty.notification {
            urgency = 'critical',
            title = 'An error happened' .. (startup and ' during startup' or '!'),
            message = msg
    }
end)