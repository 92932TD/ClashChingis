hasconnected = false
has_joined = false
function log_message(msg) {
    if (!variable_global_exists("debug_lines")) {
    global.debug_lines = ds_list_create();
}

    ds_list_add(global.debug_lines, msg);

    while (ds_list_size(global.debug_lines) > 10) {
        ds_list_delete(global.debug_lines, 0);
    }
}

// --- Create TCP socket ---
global.Client_Socket = network_create_socket(network_socket_tcp);

// --- Attempt to connect asynchronously ---
global.Connection_ID = network_connect_async(
    global.Client_Socket, 
    "127.0.0.1", // server IP
    12700        // server port
);

// --- Log attempt ---
alarm[0] = 1


