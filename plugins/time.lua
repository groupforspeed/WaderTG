--[[
#
#    Time And Date
#
#    @Dragon_born
# @GPMod
#
#
]]

function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = 'ًں•’ ط³ط§ط¹طھ '..jdat.FAtime..' \nًں“† ط§ظ…ط±ظˆط² '..jdat.FAdate..' ظ…غŒط¨ط§ط´ط¯.\n    ----\nًں•’ '..jdat.ENtime..'\nًں“† '..jdat.ENdate.. '\n@WaderTGTeam'
return text
end
return {
  patterns = {"^[#/!]([Tt][iI][Mm][Ee])$"}, 
run = run 
}
