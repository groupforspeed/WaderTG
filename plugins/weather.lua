local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

local function get_weather(location)
  print("Finding weather in ", location)
  local url = BASE_URL
  url = url..'?q='..location..'&APPID=eedbc05ba060c787ab0614cad1f2e12b'
  url = url..'&units=metric'

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  local country = weather.sys.country
  local temp = 'ط¯ظ…ط§غŒ ط´ظ‡ط± '..city..'\n\nًںŒ، ط¯ظ…ط§غŒ ع©ظ†ظˆظ†غŒ ظ‡ظˆط§ : '..weather.main.temp..' C\n\nظپط´ط§ط± ظ‡ظˆط§ :'..weather.main.pressure..'\nط±ط·ظˆط¨طھ ظ‡ظˆط§ : '..weather.main.humidity..' %\n\nًں”»ط­ط¯ط§ظ‚ظ„ ط¯ظ…ط§غŒ ط§ظ…ط±ظˆط² : '..weather.main.temp_min..'\nًں”؛ط­ط¯ط§ع©ط«ط± ط¯ظ…ط§غŒ ط§ظ…ط±ظˆط² : '..weather.main.temp_min..'\n\nًںŒ¬ ط³ط±ط¹طھ ط¨ط§ط¯ : '..weather.wind.speed..'\nط¯ط±ط¬ظ‡ ظˆط²ط´ ط¨ط§ط¯ : '..weather.wind.deg..'\n\nًں”¸ط·ظˆظ„ ط¬ط؛ط±ط§ظپغŒط§غŒغŒ : '..weather.coord.lon..'\nًں”¹ط¹ط±ط¶ ط¬ط؛ط±ط§ظپغŒط§غŒغŒ : '..weather.coord.lat
  local conditions = 'ط´ط±ط§غŒط· ظپط¹ظ„غŒ ط¢ط¨ ظˆ ظ‡ظˆط§ : '

  if weather.weather[1].main == 'Clear' then
    conditions = conditions .. 'ط¢ظپطھط§ط¨غŒ âک€'
  elseif weather.weather[1].main == 'Clouds' then
    conditions = conditions .. 'ط§ط¨ط±غŒ âکپâکپ'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions .. 'ط¨ط§ط±ط§ظ†غŒ âک”'
  elseif weather.weather[1].main == 'Thunderstorm' then
    conditions = conditions .. 'ط·ظˆظپط§ظ†غŒ ًںŒھًںŒھًںŒھًںŒھ'
  elseif weather.weather[1].main == 'Mist' then
    conditions = conditions .. 'ظ…ظ‡ ًںŒ«'
  end

  return temp .. '\n\n' .. conditions..'\n\n@WaderTGTeam'
end
local function run(msg, matches) 
    city = matches[1]
  local wtext = get_weather(city)
  if not wtext then
    wtext = 'ظ…ع©ط§ظ† ظˆط§ط±ط¯ ط´ط¯ظ‡ طµط­غŒط­ ظ†غŒط³طھ'
  end
  return wtext
end

return {

  patterns = {
   "^[/#!]weather (.*)$",
    },
  run = run
