var yy = 100; // start drawing 10 pixels from top
if (global.debug_lines) {
    for (var i = 0; i < ds_list_size(global.debug_lines); i++) {
        draw_text(10, yy, global.debug_lines[| i]);
        yy += 32; // line spacing
    }
}
draw_text(20, 100, "Test")
