local function run(msg, matches)
 local lat = matches[2]
 local lon = matches[3]
 local receiver = get_receiver(msg)
 if matches[1] == "loc" then
  send_location(receiver, lat, lon, ok_cb, false)
 elseif matches[1] == "map" then
  local zooms = {10, 16}
  local urls = {}
  for i = 1, #zooms do
   local zoom = zooms[i]
   local url = "http://maps.googleapis.com/maps/api/staticmap?zoom=" .. zoom .. "&size=600x300&maptype=roadmap&center=" .. lat .. "," .. lon .. "&markers=color:blue%7Clabel:X%7C" .. lat .. "," .. lon
   table.insert(urls, url)
  end
  send_photos_from_url(receiver, urls)
 elseif matches[1] == "view" then
  local zooms = {12, 18}
  local urls = {}
  for i = 1, #zooms do
   local zoom = zooms[i]
   local url = "http://maps.googleapis.com/maps/api/staticmap?zoom=" .. zoom .. "&size=600x300&maptype=hybrid&center=" .. lat .. "," .. lon .. "&markers=color:blue%7Clabel:X%7C" .. lat .. "," .. lon
   table.insert(urls, url)
  end
  send_photos_from_url(receiver, urls)
 elseif matches[1] == "link" then
  return "أ™â€¦أ™ث†أ™â€ڑأکآ¹أ™إ أکآھ أ™â€¦أڑآ©أکآ§أ™â€ أ™إ  أکآ¯أکآ± أڑآ¯أ™ث†أڑآ¯أ™â€‍ أ™â€¦أ™آ¾:\nhttps://www.google.com/maps/place/" .. lat .. "," .. lon
 end  
end

return {
 description = "Generate Map for GPS Coordinates", 
 usagehtm = '<tr><td align="center">gps loc أکآ¹أکآ±أکآ¶ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’,أکآ·أ™ث†أ™â€‍ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’</td><td align="right">أ™â€ أ™â€¦أکآ§أ›إ’أکآ´ أ™â€¦أ™ث†أ™â€ڑأکآ¹أ›إ’أکآھ أ™â€¦أڑآ©أکآ§أ™â€ أ›إ’ أ™â€¦أکآ®أکآھأکآµأکآ§أکآھ أ™ث†أکآ§أکآ±أکآ¯ أکآ´أکآ¯أ™â€، أکآ¯أکآ± أ™â€ڑأکآ§أ™â€‍أکآ¨ أ™â€‍أ™ث†أڑآ©أ›إ’أکآ´أ™â€ </td></tr>'
  ..'<tr><td align="center">gps link أکآ¹أکآ±أکآ¶ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’,أکآ·أ™ث†أ™â€‍ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’</td><td align="right">أکآ§أکآ±أکآ§أکآ¦أ™â€، أ›إ’ أ™â€‍أ›إ’أ™â€ أڑآ© أ™â€‍أ™ث†أڑآ¯أ™â€‍ أ™â€¦أ™آ¾ أکآ§أکآ² أ™â€¦أکآ®أکآھأکآµأکآ§أکآھ أ™ث†أکآ§أکآ±أکآ¯ أکآ´أکآ¯أ™â€،</td></tr>'
  ..'<tr><td align="center">gps map أکآ¹أکآ±أکآ¶ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’,أکآ·أ™ث†أ™â€‍ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’</td><td align="right">أ™â€ أ™â€¦أکآ§أ›إ’أکآ´ أ™â€ أ™â€ڑأکآ´أ™â€، أ›إ’ أ™â€¦أکآ®أکآھأکآµأکآ§أکآھ أ™ث†أکآ§أکآ±أکآ¯ أکآ´أکآ¯أ™â€، أکآ¯أکآ± أ™â€ڑأکآ§أ™â€‍أکآ¨ أکآ¹أڑآ©أکآ³</td></tr>'
  ..'<tr><td align="center">gps view أکآ¹أکآ±أکآ¶ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’,أکآ·أ™ث†أ™â€‍ أکآ¬أکآ؛أکآ±أکآ§أ™آپأ›إ’أکآ§أ›إ’أ›إ’</td><td align="right">أ™â€ أ™â€¦أکآ§أ›إ’أکآ´ أکآھأکآµأ™ث†أ›إ’أکآ± أکآ²أ™â€ أکآ¯أ™â€، أ™â€¦أڑآ©أکآ§أ™â€ أ›إ’ أ™â€¦أکآ®أکآھأکآµأکآ§أکآھ أ™ث†أکآ§أکآ±أکآ¯ أکآ´أکآ¯أ™â€، أکآ¯أکآ± أ™â€ڑأکآ§أ™â€‍أکآ¨ أکآ¹أڑآ©أکآ³</td></tr>',
 usage = {
  "gps loc (lat,lon) : أ™â€‍أ™ث†أڑآ©أ™إ أکآ´أ™â€  أ™â€¦أ™ث†أ™â€ڑأکآ¹أ™إ أکآھ",
  "gps link (lat,lon) : أ™â€‍أ™إ أ™â€ أڑآ© أڑآ¯أ™ث†أڑآ¯أ™â€‍ أ™â€¦أ™آ¾",
  "gps map (lat,lon) : أ™â€ أ™â€ڑأکآ´أ™â€، أ™â€¦أ™ث†أ™â€ڑأکآ¹أ™إ أکآھ",
  "gps view (lat,lon) : أکآھأکآµأ™ث†أ™إ أکآ± أ™ث†أکآ§أ™â€ڑأکآ¹أ™إ ",
 },
 patterns = {
  "^[#!/][Gg]ps (loc) ([^,]*)[,%s]([^,]*)$",
  "^[#!/][Gg]ps (map) ([^,]*)[,%s]([^,]*)$",
  "^[#!/][Gg]ps (view) ([^,]*)[,%s]([^,]*)$",
  "^[#!/][Gg]ps (link) ([^,]*)[,%s]([^,]*)$",
 }, 
 run = run 
}
