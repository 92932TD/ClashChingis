global.Server_Socket = network_create_server(network_socket_tcp, 12700, 1);
if (global.Server_Socket < 0) {
    show_debug_message("Error starting server!");
} else {
    show_debug_message("Server started on port 12700.");
}

global.Client_Socket = -1;
has_joined = false
global.isserver = true
global.next_network_id = 1;
