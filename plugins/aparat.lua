--[[

#
#     @WaderTGTeam
#   @WaderTGTeam
#      

]]

local function run(msg, matches)
 if matches[1]:lower() == 'aparat' then
  local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
  local jdat = json:decode(url)

  local items = jdat.videobysearch
  text = 'ظ†طھغŒط¬ظ‡ ط¬ط³طھظˆط¬ظˆ ط¯ط± ط¢ظ¾ط§ط±ط§طھ: \n'
  for i = 1, #items do
  text = text..'\n'..i..'- '..items[i].title..'  -  طھط¹ط¯ط§ط¯ ط¨ط§ط²ط¯غŒط¯: '..items[i].visit_cnt..'\n    ظ„غŒظ†ع©: aparat.com/v/'..items[i].uid
  end
  text = text..'\n\n@WaderTGTeam'
  return text
 end
end

return {
   patterns = {
"^[#/!](aparat) (.*)$",
   },
   run = run
}
