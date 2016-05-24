
function on_msg_receive (msg)
    if msg.out then
        return
    end
    if (msg.text=='Help') then
        send_msg (msg.from.print_name, 'Ping,Photo,Reboot,Vrec,Vstop,Vsend,Vdelcd ..,Disk', ok_cb, false)
    end
    
    if (msg.text=='Ping') then
		send_msg (msg.from.print_name, 'Pong', ok_cb, false)
    end
    
    if (msg.text=='Photo') then
     	os.execute('/usr/bin/raspistill -w 800 -h 600 -o /tmp/photo.jpg')
     	send_photo (msg.from.print_name, '/tmp/photo.jpg', ok_cb, false)
    end

    if (msg.text=='Vrec') then        
        os.execute('/usr/bin/raspivid -o ~/videos/video_`date +%m-%d_%H-%M-%S`.h264 -t 0 &')
        send_msg (msg.from.print_name, 'Recording.', ok_cb, false)
    end

    if (msg.text=='Vstop') then        
        os.execute('/usr/bin/killall raspivid')
        send_msg (msg.from.print_name, 'Done.', ok_cb, false)
    end

    if (msg.text=='Vsend') then

        local i, t, popen = 0, {}, io.popen
        local pfile = popen('ls -a ~/videos/')
        
        for filename in pfile:lines() do
            os.execute('/usr/bin/MP4Box -fps 25 -add ~/video/'.. filename .. " ~/video/" .. filename ..".mp4")
            send_msg   (msg.from.print_name,"Sending ~/videos/" .. filename .. ".mp4", ok_cb, false)
            send_video (msg.from.print_name, '~/videos/' .. filename .. ".mp4", ok_cb, false)
        end
        
        pfile:close()    
        send_msg (msg.from.print_name, 'Done.', ok_cb, false)
    end

    if (msg.text=='Vdel') then
         os.execute('/bin/rm ~/videos/video_*')
         send_msg (msg.from.print_name, 'Done.', ok_cb, false)
    end

    if (msg.text=='Disk') then        
        local handle = io.popen("df -h / | tail -1 | awk '{print $4}'")
        local result = handle:read("*a")
        send_msg (msg.from.print_name, "Disk space on / : " .. result , ok_cb, false)
        handle:close()       
    end
    if (msg.text=='Reboot') then
     	os.execute('/sbin/reboot')
     	send_msg (msg.from.print_name, 'Rebooting...', ok_cb, false)
    end

end
 
function on_our_id (id)
end
 
function on_secret_chat_created (peer)
end
 
function on_user_update (user)
end
 
function on_chat_update (user)
end
 
function on_get_difference_end ()
end
 
function on_binlog_replay_end ()
end
