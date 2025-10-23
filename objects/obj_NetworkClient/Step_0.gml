
// Only send if connected
if (global.Client_Socket != -1) {
	if room = RoomJoin {
		room_goto(RoomPlayer2)
	}
	if !hasconnected {
	log_message("Connected to server!")
	hasconnected = true
	}

   
        with (RedParent) {
            if (!is_network_clone) {

                if (variable_instance_exists(id, "id_network")) {

                    // Create buffer
                    var buf = buffer_create(256, buffer_fixed, 1);

                    // Write packet identifier
                    buffer_write(buf, buffer_u8, 100);

                    // Write all relevant data
                    buffer_write(buf, buffer_s32, id_network);
                    buffer_write(buf, buffer_s32, x);
                    buffer_write(buf, buffer_s32, y);
                    buffer_write(buf, buffer_s32, object_index);
                    buffer_write(buf, buffer_s32, hp);
                    buffer_write(buf, buffer_s32, max_hp);
                    buffer_write(buf, buffer_s32, dmg);
                    buffer_write(buf, buffer_s32, atk_interval);
                    buffer_write(buf, buffer_s32, base_atk);
                    buffer_write(buf, buffer_s32, range);
                    buffer_write(buf, buffer_u8, isBuilding);
                    buffer_write(buf, buffer_u8, isRed);

                   
                    network_send_packet(global.Client_Socket, buf, buffer_tell(buf));

                    
                    instance_destroy()

                    buffer_delete(buf);
                }
            }
        }
    
} else {
	// --- Attempt to connect asynchronously ---
global.Connection_ID = network_connect_async(
    global.Client_Socket, 
    "127.0.0.1", // server IP
    12700        // server port
);

	


    log_message("Client not connected, skipping send");
}
