local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

-- Create the widget
local ram_widget = wibox.widget {
    text   = "RAM", -- Initial text for the widget
    align  = 'center',
    valign = 'center',
    --font = "Hack 12",
    widget = wibox.widget.textbox,
}

-- Function to update the widget text with the current Dunst status
local function update_widget()
    awful.spawn.easy_async("memory", function(stdout)
        -- Update the widget text with the output of the status command
        ram_widget.text = stdout
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

-- Create the widget
local disk_widget = wibox.widget {
    text   = "DISK", -- Initial text for the widget
    align  = 'center',
    valign = 'center',
    --font = "Hack 12",
    widget = wibox.widget.textbox,
}

-- Function to update the widget text with the current Dunst status
local function update_disk_widget()
    awful.spawn.easy_async("disk /home", function(stdout)
        -- Update the widget text with the output of the status command
        disk_widget.text = stdout
    end)
end

-- Periodically check the ram consumption and update the widget
gears.timer {
    timeout   = 1, -- Time in seconds between updates
    autostart = true,
    callback  = update_disk_widget
}

-- Initial update
update_disk_widget()

-- Return the widget
return {
ram_widget = ram_widget,
disk_widget = disk_widget
}

-- Create the RAM widget with an icon
-- local ram_widget = wibox.widget {
--     {
--         {
--             id = "icon",
--             widget = wibox.widget.textbox,
--             --font = "Hack 10",
--             text = " ",  -- RAM icon (could be a different icon from an icon font)
--         },
--         {
--             id = "text",
--             widget = wibox.widget.textbox,
--             --font = "Hack 10",
--         },
--         layout = wibox.layout.fixed.horizontal,
--     },
--     layout = wibox.container.margin(_, 2, 2),
--     set_ram_usage = function(self, text)
--         self:get_children_by_id("text")[1]:set_text(text)
--     end,
-- }
-- 
-- -- Function to update RAM usage (as percentage)
-- local function update_ram()
--     awful.spawn.easy_async_with_shell("memory", function(stdout)
--         --ram_widget:set_ram_usage(stdout:gsub("\n", ""))
--         ram_widget.text = stdout
--     end)
-- end

-- Create a timer that calls update_ram every 10 seconds
--gears.timer({
--    timeout = 1,
--    autostart = true,
--    callback = function()
--        update_ram()
--    end
--})
--
---- Set update intervals (in seconds)
----awful.widget.watch("free", 10, function() update_ram() end)
--
---- Return the widgets
--return {
--    ram_widget = ram_widget,
--}
