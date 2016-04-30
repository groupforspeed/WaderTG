local function run(msg, matches)
 if matches[1]:lower() == "config" then
  local data = http.request("http://ip-api.com/json/"..URL.escape(matches[2]).."?fields=262143")
  local jdat = JSON.decode(data)
  if jdat.status == "success" then
   local text = "ظ…ط´ط®طµط§طھ ط¢غŒ ط§ط³ ظ¾غŒ ط´ط®طµ-ط¯ط§ظ…ظ†ظ‡ ظ…ظˆط±ط¯ ظ†ط¸ط±:\n"
   .."ع©ط´ظˆط±: "..jdat.country.." - "..jdat.countryCode.."\n"
   .."ط§ط³طھط§ظ†: "..jdat.regionName.."\n"
   .."ط´ظ‡ط±: "..jdat.city.."\n"
   .."ط²غŒظ¾ ع©ط¯: "..jdat.zip.."\n"
   .."طھط§غŒظ… ط²ظˆظ†: "..jdat.timezone.."\n"
   .."ظ…ط®طھطµط§طھ ط¬ط؛ط±ط§ظپغŒط§غŒغŒ: "..jdat.lat..","..jdat.lon.."\n"
   .."ظ„غŒظ†ع© ع¯ظˆع¯ظ„ ظ…ظ¾:\nhttps://www.google.com/maps/place/"..jdat.lat..","..jdat.lon.."\n"
   .."ط´ظ…ط§ط± ظ…ظˆط¨ط§غŒظ„: "..(jdat.mobile or "-------").."\n"
   .."ط¢غŒ ظ¾غŒ ظ¾ط±ظˆع©ط³غŒ: "..(jdat.proxy or "-------").."\n"
   .."ط¢غŒ ظ¾غŒ: "..jdat.query.."\n"
   .."ط§ظˆط±ع¯ط§ظ†غŒط²غŒط´ظ†: "..jdat.org.."\n"
   .."ط¢غŒ ط§ط³ ظ¾غŒ: "..jdat.isp.."\n"
   .."ط¢غŒ ط§ط³: "..jdat.as
   send_location(get_receiver(msg), jdat.lat, jdat.lon, ok_cb, false)
   return text
  else
   return "ظ…ظ‚ط¯ط§ط± ظˆط§ط±ط¯ ط´ط¯ طµط­غŒط­ ظ†غŒط³طھ"
  end
 elseif matches[1]:lower() == "ping" then
  if matches[2] == "." then
   return "64 bytes from 212.33.207.97: icmp_seq=1 ttl=48 time=107 ms"
  else
   local cmd = io.popen("ping -c1 "..matches[2]):read('*all')
   if cmd == nil or cmd == "" or not cmd then
    return "ظ…ظ‚ط¯ط§ط± ظˆط§ط±ط¯ ط´ط¯ طµط­غŒط­ ظ†غŒط³طھ"
   else
    local char1 = cmd:find('data.')+5
    local char2 = cmd:find('\n\n')
    local text = cmd:sub(char1, char2)
    local text = text:gsub(": ", "\n")
    return text
   end
  end
 elseif matches[1]:lower() == "whois" then
  return io.popen("whois "..matches[2]):read('*all')
 elseif matches[1]:lower() == "ip" then
  return "ط¨ط±ط§ظٹ ظ…ط´ط§ظ‡ط¯ظ‡ ظٹ ط¢ظٹ ظ¾ظٹ ط®ظˆط¯ ط¨ظ‡ ظ„ظٹظ†ع© ط²ظٹط± ظ…ط±ط§ط¬ط¹ظ‡ ع©ظ†ظٹط¯\nhttp://umbrella.shayan-soft.ir/ip"
 elseif matches[1]:lower() == "getip" then
  if not matches[2] then
   return 'ط¢ط¯ط±ط³ ط²غŒط± ط±ط§ ط¨ظ‡ ط´ط®طµ ظ…ظˆط±ط¯ ظ†ط¸ط± ط¨ط¯ظ‡غŒط¯ ظˆ ط§ط² ط§ظˆ ط¨ط®ظˆط§ظ‡غŒط¯ ظˆط§ط±ط¯ ط¢ظ† ط´ظˆط¯ ظˆ طھظˆع©ظ† ط±ط§ ط¨ط§ ط±ظˆط´ ظ…ظ‡ظ†ط¯ط³غŒ ط§ط¬طھظ…ط§ط¹غŒ (ع¯ظˆظ„ ط²ط¯ظ† ط´ط®طµ) ط§ط² ط§غŒط´ط§ظ† ط¨ع¯غŒط±غŒط¯ ظˆ ط¨ط§ غŒع© ظپط§طµظ„ظ‡ ط¨ط§ ظ‡ظ…غŒظ† ط¯ط³طھظˆط± ظˆط§ط±ط¯ ع©ظ†غŒط¯ طھط§ ط¢غŒ ظ¾غŒ ظˆغŒ ط±ط§ ط¨ط¨غŒظ†غŒط¯\nhttp://umbrella.shayan-soft.ir/get'
  else
   local getip = http.request("http://umbrella.shayan-soft.ir/get/umbrella"..matches[2]..".config")
   if getip == "not found" then
    return "طھظˆع©ظ† ظˆط§ط±ط¯ ط´ط¯ظ‡ طµط­غŒط­ ظ†غŒط³طھ"
   else
    return "ط¢غŒ ظ¾غŒ ط´ط®طµ ظ…ظˆط±ط¯ ظ†ط¸ط±:\n"..getip
   end
  end
 end
end

return {
 description = "IP and URL Information", 
 usagehtm = '<tr><td align="center">ip</td><td align="right">ظ„غŒظ†ع©غŒ ط¯ط± ط§ط®طھغŒط§ط±طھط§ظ† ظ‚ط±ط§ط± ظ…غŒط¯ظ‡ط¯ ع©ظ‡ ط¨ط§ ظˆط±ظˆط¯ ط¨ظ‡ ط¢ظ† ظ…غŒطھظˆط§ظ†غŒط¯ ط¢غŒ ظ¾غŒ ط®ظˆط¯ ط±ط§ ظ…ط´ط§ظ‡ط¯ظ‡ ع©ظ†غŒط¯</td></tr>'
 ..'<tr><td align="center">getip</td><td align="right">ظ„غŒظ†ع© ط§ط±ط§ط¦ظ‡ ط´ط¯ظ‡ ط±ط§ ط¨ظ‡ ط´ط®طµ ظ…ظˆط±ط¯ ظ†ط¸ط± ط¨ط¯ظ‡غŒط¯ ظˆ ط§ط² ط¢ظ† طھظˆع©ظ†غŒ ع©ظ‡ ط³ط§غŒطھ ط¨ظ‡ ط§ظˆ ظ…غŒط¯ظ‡ط¯ ط±ط§ ط¨ط®ظˆط§ظ‡غŒط¯. ط§ع¯ط± ط¢ظ† طھظˆع©ظ† ط±ط§ ط¨ط§ غŒع© ظپط§طµظ„ظ‡ ط¨ط¹ط¯ ط§ط² ظ‡ظ…غŒظ† ط¯ط³طھظˆط± ظˆط§ط±ط¯ ع©ظ†غŒط¯طŒ ط¢غŒ ظ¾غŒ ط´ط®طµ ظ…ظˆط±ط¯ ظ†ط¸ط± ظ†ظ…ط§غŒط´ ط¯ط§ط¯ظ‡ ظ…غŒط´ط¯<br>http://umbrella.shayan-soft.ir/get</td></tr>'
 ..'<tr><td align="center">config ط¢غŒ ظ¾غŒ غŒط§ ظ„غŒظ†ع©</td><td align="right">ط§ط·ظ„ط§ط¹ط§طھغŒ ع©ظ„غŒ ط±ط§ط¬ط¹ ط¨ظ‡ ط¢ظ† ظ„غŒظ†ع© غŒط§ ط¢غŒ ظ¾غŒ ط¯ط± ط§ط®طھغŒط§ط±طھط§ظ† ظ‚ط±ط§ط± ظ…غŒط¯ظ‡ط¯. ط¯ظ‚طھ ع©ظ†غŒط¯ ظ„غŒظ†ع© ط¨ط¯ظˆظ† ط§ع† طھغŒ طھغŒ ظ¾غŒ ظˆط§ط±ط¯ ط´ظˆط¯</td></tr>'
 ..'<tr><td align="center">ping  ط¢غŒ ظ¾غŒ غŒط§ ظ„غŒظ†ع©</td><td align="right">ط§ط² ط³ط±ظˆط± ط¨ط§ ظ¾ظˆط±طھ ظ‡ط§غŒ ظ…ط®طھظ„ظپ ظ¾غŒظ†ع¯ ظ…غŒع¯غŒط±ط¯. ط¯ظ‚طھ ع©ظ†غŒط¯ ظ„غŒظ†ع© ط¨ط¯ظˆظ† ط§ع† طھغŒ طھغŒ ظ¾غŒ ظˆط§ط±ط¯ ط´ظˆط¯</td></tr>'
 ..'<tr><td align="center">whois ظ„غŒظ†ع©</td><td align="right">غŒع© ط¯ط§ظ…غŒظ† ط±ط§ ط¨ط±ط±ط³غŒ ظ…غŒع©ظ†ط¯ ظˆ ط¯ط± طµظˆط±طھغŒ ع©ظ‡ ظ‚ط¨ظ„ط§ ط¨ظ‡ ط«ط¨طھ ط±ط³غŒط¯ظ‡ ط¨ط§ط´ط¯طŒ ظ…ط´ط®طµط§طھ ط«ط¨طھ ع©ظ†ظ†ط¯ظ‡ ط±ط§ ط¨ظ‡ ط§ط·ظ„ط§ط¹ ط´ظ…ط§ ظ…غŒط±ط³ط§ظ†. ط¯ظ‚طھ ع©ظ†غŒط¯ ظ„غŒظ†ع© ط¨ط¯ظˆظ† ط§ع† طھغŒ طھغŒ ظ¾غŒ ظˆط§ط±ط¯ ط´ظˆط¯</td></tr>',
 usage = {
  "ip : ط¢ظٹ ظ¾ظٹ ط´ظ…ط§",
  "getip : ط¯ط±غŒط§ظپطھ ظˆ ط°ط®غŒط±ظ‡ ط¢غŒ ظ¾غŒ ط¯غŒع¯ط±ط§ظ†",
  "getip (token) : ظ†ظ…ط§غŒط´ ط°ط®غŒط±ظ‡ ط´ط¯ظ‡",
  "config (ip|url) : ظ…ط´ط®طµط§طھ",
  "ping (ip|url) : ظ¾ظٹظ†ع¯",
  "whois (url) : ط¨ط±ط±ط³ظٹ ط¯ط§ظ…ظ†ظ‡",
 },
 patterns = {
  "^[#!/]([Ii]p)$",
  "^[#!/]([Gg]etip) (.*)$",
  "^[#!/]([Gg]etip)$",
  "^[#!/]([Cc]onfig) (.*)$",
  "^[#!/]([Pp]ing) (.*)$",
  "^[#!/]([Ww]hois) (.*)$",
 }, 
 run = run
}
