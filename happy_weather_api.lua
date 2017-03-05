-- 
-- Happy Weather API

-- License: MIT

-- Credits:
-- * xeranas


happy_weather = {}

local registered_weathers = {}
local active_weathers = {}


happy_weather.register_weather = function(weather_obj)
	table.insert(registered_weathers, weather_obj)
end

happy_weather.is_weather_active = function(weather_cd)
	for k, weather_ in ipairs(active_weathers) do
		if weather_.code == weather_cd then
			return true
		end
	end
	return false
end

local add_active_weather = function(weather_obj)
	table.insert(active_weathers, weather_obj)
end

local remove_active_weather = function(weather_cd)
	for k, weather_ in ipairs(active_weathers) do
		if weather_.code == weather_cd then
			table.remove(active_weathers, k)
			return
		end
	end	
end

-- Global step function
-- loop through registered weathers and check which weather is about to start or end
minetest.register_globalstep(function(dtime)

	if #registered_weathers == 0 then
		-- no registered weathers, do nothing.
		return
	end

	-- Loop through registered weathers
	for i, weather_ in ipairs(registered_weathers) do
		-- Loop through connected players (weathers are attached to players)
		for ii, player in ipairs(minetest.get_connected_players()) do
			
			-- Weaher is active checking if it about to end
			if (weather_.active) then 
				if (weather_.about_to_end(dtime)) then
					weather_.clear_up(player)
					weather_.active = false
					remove_active_weather(weather_.code)
				
				-- Weather still active updating it
				else
					weather_.update(dtime, player)
				end

			-- Weaher is not active checking if it about to start
			else
				if (weather_.about_to_start(dtime)) then
					weather_.setup(player)
					weather_.active = true
					add_active_weather(weather_)
				end
			end	
		end
	end
end)
