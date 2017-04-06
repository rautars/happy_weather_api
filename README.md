Happy Weather API
===================
Minetest mod-api to help organize weathers.

Overview
------------
All weathers parameters and functions should be defined under single object. For reference lets call it `weather_obj`.

Weather object fields
-------
Weather code is mandatory property.

property name      | description
------------------ | ---------------------------------
code               | used to identify weather
active             | weather state flag managed by API
affected_players   | table of players affected by weather managed by API

Weather object callback methods
-------
Callback methods which will be invoked by API. It's recommended to implement all bellow callback methods.

function name | arguments       | return type | description
------------- | --------------- | ----------- | -----------
is_starting   | dtime, position | boolean     | should return true if weather is ready to start, false otherwise.
is_ending     | dtime           | boolean     | should return true if weather is ready to end, false otherwise.
add_player    | player          | void        | should apply effect for player (change sky, initialize sounds and etc).
remove_player | player          | void        | should remove weather from player 
in_area       | position        | boolean     | should return true if position is in weather area, false otherwise.
render        | dtime, player   | void        | should apply visual, sound or anything else needed to represent weather. 

These methods are not part of weather API lifecycle and expected to be invoked manually (e.g. weather commands, other weather related mods). 

function name | arguments | return type | description
------------- | --------- | ----------- | -----------
start         | position  | void        | should start weather at given position (or just apply weather world wide)
stop          | < none >  | void        | should end weather

Weather API methods
-------
function name     | arguments     | return type | description
----------------- | ------------- | ----------- | -----------
register_weather  | weather_obj   | void        | will register weather
is_weather_active | weather_code  | boolean     | will return true if weather is active, false otherwise

