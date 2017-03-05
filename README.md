# Happy Weather API
a minetest mod-api for creating own weather

```
-- Main weather object template
local weather_obj = {
	-- Weather code used to identify weather
	code = "weather code",

	-- Managed by API. Returns true if weather active, false otherwise
	active = "false",

	-- Will be called to check if wheater should be activated
	about_to_start  = "function(dtime)",

	-- Will be called to check if wheater should be deactivated
	about_to_end = "function(dtime)",

	-- Will be called on weather start
	setup = "function(player)",

	-- Will be called on game step
	update = "function(dtime, player)",

	-- Will be called on weather end (after condition_check returns false)
	clear_up = "function(player)",
}
```
