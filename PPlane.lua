function on_msg_receive (msg)
    if msg.out then
        return
    end
    
    if (msg.text=='Ping') then
		send_msg (msg.from.print_name, 'pong', ok_cb, false)
    end
    
    if (msg.text=='Photo') then
     	os.execute('/usr/bin/raspistill -w 800 -h 600 -o /tmp/photo.jpg')
     	send_photo (msg.from.print_name, '/tmp/photo.jpg', ok_cb, false)
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
