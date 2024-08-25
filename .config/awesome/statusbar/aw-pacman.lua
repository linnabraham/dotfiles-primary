local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

-- Create the widget
local pacman_widget = wibox.widget {
    text   = " ", -- Initial text for the widget
    align  = 'center',
    valign = 'center',
    --font = "Hack 12",
    widget = wibox.widget.textbox,
}

-- Function to update the widget text with the current Dunst status
local function update_widget()
    awful.spawn.easy_async_with_shell("checkupdates | wc -l", function(stdout)
        -- Update the widget text with the output of the status command
        pacman_widget.text = stdout
        -- Trim the newline character from the output
        local update_count = stdout:gsub("%s+", "")
        pacman_widget.text = "  " .. update_count    end)
end

-- Initial update
update_widget()

-- Periodically check the ram consumption and update the widget
gears.timer {
    timeout   = 1800, -- Time in seconds between updates
    autostart = true,
    callback  = update_widget
}

return pacman_widget
