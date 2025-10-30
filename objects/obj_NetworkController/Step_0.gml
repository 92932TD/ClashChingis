if (global.Client_Socket != -1) {
	if room != RoomPlayer1 {
		room_goto(RoomPlayer1)
	}

    var unit_parents = [BlueParent, RedParent];

    for (var u = 0; u < array_length(unit_parents); u++) {
        var parent_type = unit_parents[u];

        with (parent_type) {
            if (variable_instance_exists(id, "id_network")) {

                var buf = buffer_create(256, buffer_fixed, 1);

                buffer_write(buf, buffer_u8, 100); 
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
                buffer_delete(buf);
            }
        }
    }
	 with (oProjectile) {
        var buf = buffer_create(128, buffer_fixed, 1);

        buffer_write(buf, buffer_u8, 670); 
        buffer_write(buf, buffer_s32, id_network); 
        buffer_write(buf, buffer_s32, x);
        buffer_write(buf, buffer_s32, y);
       
        network_send_packet(global.Client_Socket, buf, buffer_tell(buf));
        buffer_delete(buf);
    }
}
