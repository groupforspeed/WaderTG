do

local function run(msg, matches)
  if matches[1] == 'office' then
    if is_sudo(msg) then
    -- send_document(get_receiver(msg), "/home/Seed/axs/sudo.webp", ok_cb, false)
      return "شما صاحب ربات WaderTG هستید"
    elseif is_owner(msg) then
   --send_document(get_receiver(msg), "/home/Seed/axs/owner.webp", ok_cb, false)
      return "شما مدیر اصلی گروه هستید"
    elseif is_momod(msg) then
  --send_document(get_receiver(msg), "/home/Seed/axs/mod.webp", ok_cb, false)
      return "شما کاربر هستید"
    else
 -- send_document(get_receiver(msg), "/root/Tele/axs/mmbr.webp", ok_cb, false)
      return "شما عضو هستید"
    end
  end
end

return {
  patterns = {
    "^[#!/]([Oo]ffice)$"
    },
  run = run
}
end 
