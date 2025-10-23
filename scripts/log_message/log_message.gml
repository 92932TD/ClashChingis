function log_message(msg) {
    if (!global.debug_lines) global.debug_lines = ds_list_create();
    ds_list_add(global.debug_lines, msg);

    while (ds_list_size(global.debug_lines) > 10) {
        ds_list_delete(global.debug_lines, 0);
    }
}
