local function chat_list(msg)
    local data = load_data(_config.moderation.data)
        local groups = 'groups'
        if not data[tostring(groups)] then
                return 'No groups at the moment'
        end
        local message = 'List Groups WaderTG:\n*Use #join [ID-CHAT] to join\n*Use #link [ID-CHAT] send link chat\n\n '
        for k,v in pairs(data[tostring(groups)]) do
                local settings = data[tostring(v)]['settings']
                for m,n in pairsByKeys(settings) do
                        if m == 'set_name' then
                                name = n
                        end
                end

                message = message .. 'ًں‘¥ '.. name .. ' (ID: ' .. v .. ')\n\n '
        end
        local file = io.open("./groups/lists/listed_groups.txt", "w")
        file:write(message)
        file:flush()
        file:close()
        return message
end
local function run(msg, matches)
  if msg.to.type ~= 'chat' or is_sudo(msg) and is_realm(msg) then
  local data = load_data(_config.moderation.data)
  if is_sudo(msg) then
    if matches[1] == 'link' and data[tostring(matches[2])] then
        if is_banned(msg.from.id, matches[2]) then
     return 'You are in ban'
  end
      if is_gbanned(msg.from.id) then
            return 'You are in Globalban or Superban'
      end
      if data[tostring(matches[2])]['settings']['lock_member'] == 'yes' and not is_owner2(msg.from.id, matches[2]) then
        return 'Group is private.'
      end
          local chat_id = "chat#id"..matches[2]
          local user_id = "user#id"..msg.from.id
      chat_add_user(chat_id, user_id, ok_cb, false)   
   local group_link = data[tostring(matches[2])]['settings']['set_link']
   local group_name = data[tostring(matches[2])]['settings']['set_name']
   return "Group Link:\n"..group_link.."\n\n(Group name:"..group_name..")\nCreate by:@WaderTGTeam"
   
    elseif matches[1] == 'link' and not data[tostring(matches[2])] then

          return "Group not found"
         end
    end
  else
   return "Just for sudo!"
  end

     if matches[1] == 'groups' then
      if is_sudo(msg) and msg.to.type == 'chat' then
         return chat_list(msg)
       elseif msg.to.type ~= 'chat' then
         return chat_list(msg)
      end
 end
 end
return {
    description = "See link of a group and groups list",
    usage = "!link ID && !groups",
patterns = {"^[!#/]([Ll]ink) (.*)$","^[!#/]([Gg]roups)$"},
run = run
}
