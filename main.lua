local sr_ref = Game.start_run
function Game.start_run(self, args)
local ret = sr_ref(self, args)
SMODS.set_scoring_calculation("add")
return ret
end

-- thanks lost edition (heart)

local includes = {
    'assets',
    'deck',
}

-- Load modules
for _, include in ipairs(includes) do
    local success, error_msg = pcall(function()
        local init, error = SMODS.load_file("includes/" .. include .. ".lua")
        if error then
            sendErrorMessage("Failed to load " .. include .. " with error: " .. error)
        else
            if init then init() end
            sendDebugMessage("Loaded module: " .. include)
        end
    end)
    if not success then
        sendErrorMessage("Error in module " .. include .. ": " .. error_msg)
    end
end