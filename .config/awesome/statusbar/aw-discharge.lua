local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Create the widget
local discharge_widget = wibox.widget {
    text   = "TIME", -- Initial text for the widget
    align  = 'center',
    valign = 'center',
    --font = "Hack 12",
    widget = wibox.widget.textbox,
}

-- Function to update the widget text with the active pc usage time
local function update_widget()
    awful.spawn.easy_async("discharge", function(stdout)
        -- Update the widget text with the output of the status command
        discharge_widget.text = " " .. stdout
    end)
end

-- Periodically check the ram consumption and update the widget
gears.timer {
    timeout   = 1, -- Time in seconds between updates
    autostart = true,
    callback  = update_widget
}

-- Initial update
update_widget()

return discharge_widget
