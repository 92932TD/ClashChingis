function arrow_spellred(xx, yy, radius, damage, towerdamage, spd) {
    if (global.Client_Socket != -1) {
        var buffer_out = buffer_create(256, buffer_fixed, 1);
        buffer_write(buffer_out, buffer_u8, 150); 
        buffer_write(buffer_out, buffer_f32, xx);
        buffer_write(buffer_out, buffer_f32, yy);
        buffer_write(buffer_out, buffer_f32, radius);
        buffer_write(buffer_out, buffer_s32, damage);
        buffer_write(buffer_out, buffer_s32, towerdamage);
		buffer_write(buffer_out, buffer_f32, spd);
		

        network_send_packet(global.Client_Socket, buffer_out, buffer_tell(buffer_out));
        buffer_delete(buffer_out);
    }
}
