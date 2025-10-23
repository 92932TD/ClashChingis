if global.Client_Socket != -1 {
    var buff = buffer_create(64, buffer_fixed, 1);
    buffer_write(buff, buffer_u8, 200); 
    buffer_write(buff, buffer_s32, id_network);
    network_send_packet(global.Client_Socket, buff, buffer_tell(buff));
    buffer_delete(buff);
}
